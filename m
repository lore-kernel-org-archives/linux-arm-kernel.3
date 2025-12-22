Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115C5E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EkfFwQ+7c9l0H1ZxajjVglkDWGPmhRMd4V6jMyk8BEw=; b=M3uI3uioaHhA7qFmuOv+3vqTap
	JqiOHUEbMbAPmsRxW+A1hvA0MPDD/s6o8eKQUQV+yRhAIB8GUMzHe8gOJlADa8qH/EbejkvpdGlxh
	4vK8kslxWyepfeZ2FUcCtR4Peh1hk7QUXkUNUSa2UC1oOD4FYzrcAMyqJRH5UzYYjZblZT7IXlWZg
	3RxEiZMorC+yrEX+joKeUz+uH/bzuntV4bbji8xNeiMmR2RPqQEcLZr3lHw/HOEr44KuvkJF5AoAv
	Q+iI945doL2R38ksYFNTdfbe5XOZdInKtjKkJahJyc9PIB6i2RB5h4oQFcT1/9OrKpE1R0A/ETyh/
	7OurCygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXYyB-0000000DDeR-2uCQ;
	Mon, 22 Dec 2025 06:00:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXYyA-0000000DDdm-3Vcz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Dec 2025 06:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EkfFwQ+7c9l0H1ZxajjVglkDWGPmhRMd4V6jMyk8BEw=; b=RdslFrsTh/sMH7H2bGlqMzsAtp
	yWU4mOhNgddN+4tAJli1tGxat//0u5kt1qE6zOQtiqpVAVYZnkd/6A6J1AC+8M7Z1wnhwElT4WwBx
	pjNxTX2im+N5qA4WDxar9PpFPJKjbNnYesoGI4hcDJSDXJ9BsbLRANL8Npn53Mt3kztZRbI/1Zjm3
	2kO0rsesLWG8pU2Nds3lndjM2MbEMPrIt9KuaeOlW+Zo3A+6rHizXx+8hwxU2uC4yNWBmWl10LMxF
	/cnW6hxrX3AU5b+NPgGI38QC3HOU6S/AJlJlWD2x37jbaSuT2UepRbWdy5VqPRzdkuSBXNcTUs4a3
	hpaX5/dA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXY6f-0000000EOjv-2UDh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 05:05:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMv9RS3808462
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=EkfFwQ+7c9l0H1ZxajjVglkDWGPmhRMd4V6jMyk8BEw=; b=ms
	KaCz3jQt4ygKf2dOGdSe2zDL8IgtnaIBjpB6ZzGou6moXLZB0czObDNGanBZXpPS
	Afks8xu9I3PcrbuD76UEBlRTGOP5BP0TZUc8SaSHkaUUQkHYC0nTsSGwe0WFj3K/
	zkov0LZBsrwAu/RTCZZFNmIbwLzJOC8nZKhcmFd3QfINPy4EKstgKtv/02TpTnbh
	nose4i3cC6h9Regnf7ln6vDob+/XVVULOisY/IobZ1ImmecZv6Fj6wUQhD3NgtdT
	TBGYlvdHUY8Haar3eS3l4ZzgHj0iuRPPUkKVu3IYA2MvLXP2KT9Zj2+FrTTcXHhd
	BFvDVFH7IFHf7ZC2l06A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru3uw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:00:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7c240728e2aso7878324b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 22:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383224; x=1766988024; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EkfFwQ+7c9l0H1ZxajjVglkDWGPmhRMd4V6jMyk8BEw=;
        b=EFJYeOxnPYInlRJ9agKZspjdM2bBKqTk4d5bvZj2LH5qHaMfgRqinYGgudwWg/SPob
         1DKkRzcILHu5ZAamKWRRn58zEM3MJeoyp1DGsmlcVmA/y4YrRvhnNh2ZHIrIJlVwjcqA
         1RvUlIJye0AyuTyzFs4LdJqx9Sc6UnBW857HktTNSXy3LvFeBsUTCLDRQorlp2TkBhvV
         QhmbtIQ1CT0kYdVcXpDZxnd7feObvoDGA8h42A6L+yLucstMCCe+b9K96VZellM9R8Ko
         d8f9OQB05F4TfGzJCDUg/H5DfmNI5ixypF6L0D2KRqMsKEzw7WVJFFJIi7EmjBprXaoy
         yMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383224; x=1766988024;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkfFwQ+7c9l0H1ZxajjVglkDWGPmhRMd4V6jMyk8BEw=;
        b=LsXWpnmfzc779Ah81wxUUxIxuz7thYBncPbwKZb2wSANkV/GdiHrXaxcKHB+FL4kHL
         p8CcGV5gZjQatiBq5TyBZeKH5hnFjq1e7rvHSd+h1U8ACk/zRY2Vvb8a8+F5SF0003z6
         4mv/VwwmnKrAJCg1fuFnAArqhLCbk1wNJY3I5CA7QG2UHaFSuJpzEQdQfH+UYTEdNu3S
         V5j1/vmy+aY9TvIobB7NixbYYpTO32nkR3aW2F4uJKpcdXWJ7QdAU6RtD3yDCIDALT6x
         bCogBZLsM62tuKEEteJkqNsRTBXAEDFfMsFDb50XzkuJmh0OAHC7BnFTG+MI9C2AXapN
         igyg==
X-Forwarded-Encrypted: i=1; AJvYcCVYMSmhpMxv1SHxmCdttkGhg6VcERO7tWm3FYl2O/nsiM6q2tjcdqfGb5n0hqZ8yn8jhntYra7zVCc/hmmt8bw5@lists.infradead.org
X-Gm-Message-State: AOJu0YzPIy1m58LeL3zDfj6CiVvr8g+KZaSEFifsWS7HQnmZVWJCeyld
	psIYVWvSNx8XbYc0GVnn/NfiLE25LncK1YNBsoNJKoKfJSNYxieZGeKKJI+7cKzy6dxQ2+JGg+f
	MyM3UTOBsZG44QkUgvvNvCOKy2Qn5wcWhv8Axo0lPE+P1VGIAgnivKnei+MtvA1lKbxEA+SePOy
	5VGKW/s72nIA==
X-Gm-Gg: AY/fxX6adO19Y3/adyQkOj4w5m1w6qJPZQEyTHMi5RqRogGxgH6hITpMTVd0qEZEiSE
	TVnffJ/HPMCIWKoAtHco98THyexI+AQiSko4FahBqAVa2Hsq8y+xPRLqMeLRk4wgrzbIRWZ8C/g
	k3B6QS8u8dAEg8mM3nSOWNFLG8PvXne3SLZoR5xu8tcoIYlwju1NX0U1/lmGTXpWkdcWf1I70Aj
	HUZSBS2q5oEavOP9h1dc6lEwKEk9KK0cLR9sNM/V3N/pphxaFj9U7UvFC/dPKNmp+Ff8j9DdyBz
	TyZsHOGfTb/w014UPe1R36xYthJbFHQxdco+wh8ao348HAcwdqAgxiQtCXZGYGyLbf5Nezs+Z3l
	uOSQlBDJR4PraMIy8tuEhLUEf8r3DizosGx2es5EmWhc=
X-Received: by 2002:a05:6a00:4295:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7ff648e71c8mr8362773b3a.15.1766383224283;
        Sun, 21 Dec 2025 22:00:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLdwWxLM+DGPgEyWM20tvgmySSHg8PLe+eOCrjv5WpxgqOKsjiH21ugO6FRbrcVGZZ9l73dA==
X-Received: by 2002:a05:6a00:4295:b0:781:17fb:d3ca with SMTP id d2e1a72fcca58-7ff648e71c8mr8362749b3a.15.1766383223749;
        Sun, 21 Dec 2025 22:00:23 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e88cdaesm8987572b3a.63.2025.12.21.22.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:00:23 -0800 (PST)
Date: Mon, 22 Dec 2025 11:30:19 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: SMP boot issue during system resume
Message-ID: <dfa19ca7-c4c6-4386-a54d-44d623c8d3ed@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfX4DQJtQPTIIfa
 YFrurnG8y2VAEtn0YJ04j9pulRT2F0QqaGPT407epKuQNOH/oi2TsL5MAKcNo17ckC6yut2EZek
 5cuJCY1bX2Kanhm/rQN8BzAEwuvGyN1BJfD3u376M/aD18VIoLlfUf4h3ukReJOBS1SaIVZipzw
 IiGcx8jOUiOklbAKVfw760qdJxgIYm0tANnwDiLylxtHMwInsI1rqfI6NBpJp5BG7NIUaGZwRCG
 omDfv7VhwNRkrQKPjtnPkEZFGt18O9i7Vrv+Hdd8OK7sICCOmAz5bUL1r7Ox5eIpAZT0YRyZtj0
 RIUYRItz8lnNgADULBOmEPgUCovp1qXEEHiQBQVbVrRSjl52LYVAhhen/yaKorIFArmP8NEctdb
 83thhNTQYxBk/2OXmhOjUXQC+vWkjjWNHJfGJ5zQlJWIm0/NsCA37xJLXZCl4FPZRbetAuRZclT
 h9SpU15ht1txzEDP/Vg==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=6948de79 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=AzHi_07Hxf6F1TnpHmwA:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: cXDJSOH7L_1rMoUWzQWavOxg_4395Jkf
X-Proofpoint-GUID: cXDJSOH7L_1rMoUWzQWavOxg_4395Jkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_050518_262463_667C51DC 
X-CRM114-Status: GOOD (  14.58  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi

We are seeing a SMP boot issue during system resume when CPUs are brought 
online via pm_sleep_enable_secondary_cpus()->thaw_secondary_cpus()->_cpu_up() 
on ARM64.

The _cpu_up() sets a global variable

secondary_data.task = idle;

and wait for the secondary CPU to come online. A 5 second timeout is
used here. If at all, the secondary CPU comes online after this timeout,
we expect it to loop in kernel via __secondary_too_slow(). However, this
depends on secondary_data.task value. Since we are bringing all disabled
cores, after timeout, we set this global variable to the next CPU idle
task and the late secondary CPU thinks the value is its idle task and
does not enter __secondary_too_slow().

An earlier attempt [1] to fix similar issue incrased the timout to 5
seconds. We could reproduce this issue in Linux guest where vCPU
scheduling latency can be higher under heavy load on the host.

I would like to seek your inputs on how we can improve the current
situation. We would like to avoid __secondary_too_slow() spin even when
the CPU comes late. This is probably not a desired behavior for other cases like 
Linux running bare metal or some guests. Having a Kconfig option or
kernel param might help here.

[1] https://lore.kernel.org/all/20190827151815.2160-1-will@kernel.org/

