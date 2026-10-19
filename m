Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A915CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=; b=2hSBCOY9NvokvjeeFinjouSUbl
	phJhr/6mNLxM2/YERWhAesRkw+sCiXV9gq9/hHEAa1co32AT5KaeC/yusU1S309qB5/Z83l/qe+x1
	AjhQuo4t+8AUshjNbm9x//LeQpdkgej9PYuyPW3s2J1Kpt3BBYgmhuFk6eAhza/nS7Ye2Se8SLVXb
	aOjcER86mZulSTkKgrMFXXoRXZmJ7U5BeQ6WEMC4h7Adn2832QVQDMoZLX1WWfTwCzu6V5E4byEQt
	A4OWkd6O5Vlc0wDrtHBIgXcjHyD6M9pzVv0GC7J3NRJojAqfxE3UNSB+IUA3tQ/FijzDVg0xjrotA
	ZsvMMQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlGK-00000007GHc-48Kb;
	Mon, 19 Oct 2026 11:10:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlGH-00000007GGu-2hHF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:10:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Owm91168072
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 11:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=; b=fIvRQS+WNTQUDsmm
	qGhbkBQxjgT2ei53rLtGJjs34jn1NgtcXRMimISptvqNAFANvFnG/mfoBilch3U+
	oUzJiR2s9MFaFVEciT3WW9f9yspFqZZ/c96u5P/I8UoptZuJlBN0yIWONS0a6YdG
	8M2XepF5mujsbIcAzggQOxq6jh/XkaRhduBdkPUg39RzaL0pbqlPuZeQeSm1VzEL
	zZfpNgb1V+ppPh9y7etWznBo9/MK3q2c/CUNbwRomOT2fS12O+27Qy3ery++wsq+
	3q1RIhxa9PqLtBtCS/Mua3wEjyMd+qsWnfV0FNcNW+0EkBxbvrKyMZxBUTpZdaTw
	oNljvQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8rwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 11:10:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so34592485a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792408236; x=1793013036; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
        b=X3xdZtv2jEZZDCU1dkRoYjvkA0djGmDFvnWadVERGTW77duXpI+o50KbyHDh/kLuPk
         dFf0Q8St+2NgiOykVbDOEjoHLTze8NSIoE8h89XrG/8XMB24YQCxGYjj6Zcq/f5pgPxj
         WhufHImbsSm3fLE5s8mHC1MehuUO0C4qNH5LtqwIT04aSfzS2/2iDZc6o3/QfcKb62Qa
         kRLtDv+GrOSo1z86FPPh2nXqBAov8XcqDX44FgmpOOG35GtKQb8NUFGgqxiHE4otNxxA
         Ni6roHONAb7opYilYTTPPUxGubEk6b6QU/Ezs8ICw2cZEhjjrg60peBCSpwAYThlT777
         VzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408236; x=1793013036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLQMV4NI0q81zowtL7rae7nja7cb7zg7erllZqXWpA8=;
        b=i/MYOhDFaLVrbV0PsohdXpY5lg3PjhkNSuCbGQ/I3pSTQNfLHDeB7g9ozSyq/L/Vu4
         PKCUokCOUmqeneRFgBGfGoY9+EwJ1GGgmv7BaAM0fFrabsx1MKI+Ua/3HJKEdYjSMaXL
         ECyg9yBeqAeVVxmhqbcaM8InOkI7p77AxsEQ0Ts14nVJnX0KsToRvtq/Xs0XlgbAPZ6q
         DZacjl/HtbrLinxmIRoZpF63H6x49e8in8DVQ20/Y905xRNhmf6eC6ffY3JrHbX6EIYI
         t55Lki5JEN6VYFbI25kt45z0DJmjMeZ6Nfhp8phop1iEpwt+cC+uYQiI5AwXQat4EROC
         nDzA==
X-Forwarded-Encrypted: i=1; AKwUvBzYefM4/Kq9QYhzRyygqUsRyPG8mibzgBuoNZByo3vd4ow+mnz8aRepWhoxsNpoFjucadbc5h3WojyXynrtEfGJ@lists.infradead.org
X-Gm-Message-State: AFq9FYJmYzXvS6cBTM8JO39qKd3uPgVQO6LKX4Fd81LEl5HAFIqOHDhG
	ToKXCyZkdnSffNKTjE5SRup595EPrumA4LHL3H35FJ/tRxhCXZAVvY3kaNjrQs8FnnC06UMrFmp
	FbZyI1NoKgdngL3VY7fn0yKuWwEj7m1hUoAF84ApdENzJv7CKoO4f4zB6UCDLsF7mTC+QxQtGxi
	czTA==
X-Gm-Gg: AYBFou0pXRG3hxaF+gWUM/PAO94ait8gmqBaz7S9TivnU3DcxP+pl1XGOBginjFAsPI
	ApFiOE2GLYMJ5WN0/O0FM2rS028HxJhc9xyy6H2AlazDDDvf8ZGE2/euJEfqFOW5BrnMA52Lvsl
	2+SxGiNRp8s/XoaR0e0wBPTZwP3k/bjYhTkn8yFOb5KsinSD2F/yGQ7Ckg+bD0f0aWVU3JVfXya
	RQw0/St7PMd+n7jbytViXrME9hxJaoPqGL8LTuUvG89iV+sBxqhtmrmbi3UwR0As2QX4ltigLWi
	of0ZzA3j0wPchTJJFhfix2RxLjh3YYnGvtsEn24LM5FtGzJeESqkor8yeHv9qlwjYTNiZ2DGGLn
	5VR5dSrZTMhZo6oC0rVmU5g==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1306149985a.0.1792408235696;
        Mon, 19 Oct 2026 04:10:35 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1306144385a.0.1792408235247;
        Mon, 19 Oct 2026 04:10:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb39a3sm348351166b.81.2026.10.19.04.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:10:34 -0700 (PDT)
Message-ID: <be076bf7-52fa-4c93-9d0f-46a8d06ae920@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:10:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] irqchip: irq-qcom-mpm: Register MPM with cpu_pm
 for RPM notification
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-2-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfXzrU/jriSU6+4
 8Cw/F1eacVs3rfyXhN1zPv+1GR0GlfhoyUUZ4AR3whMKKH/KJ0dkYxeaPflrwQ9jABEkZ8RGVs4
 KtdzDTYlKEy4k6i+Pc3sPfa/J4zsB+Y=
X-Proofpoint-ORIG-GUID: eOt9F1mGjTix2I4KKr4Zw5XthjnSKUZE
X-Proofpoint-GUID: eOt9F1mGjTix2I4KKr4Zw5XthjnSKUZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NCBTYWx0ZWRfX9ybZn6aOKZl6
 PzidJOyOFxb5DdTAbjQLAoUnwPB3lEoGmUdbki2HxH4vGcZ6Nxd6ESt3kULDG7sJL5MyVXd2oFR
 7akAi3bP86NuoYvU/457qaivp/kuamCZJqEC7rdPLAyIVxhH9iE0U2cXeaacGcOHcKCaTnuiTCR
 jkXaxo8OvH0es99e/SUA9Et/rDD6YV83iNdm+sIFoHwJKSXz+ID9FY2yKsKvJ6RDTjzxGus6LWH
 dhag/xIrLr0L3LvjhVM8WMUucKzUHVuM0G34FM0WT+AMMZZ+n38RO2tIEYVAg7eP55jLWFRWxXw
 VHOqkRgXCF2EnYu4g7vtPKPbzRxQAUvY3PfffnzgE9fxZ7jb5BF0B6WtnINNdlTwhPMDSK6H38T
 EmMuOOARCNT8vC0Vaz7P93jeNqBuLyT3OmeHepTyYt4f5kpehC8gdK6u8XoUF/x2SHsYfrsC5Y6
 bORrH2eyfimow4hJpPw==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5faac cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qE2Ob0BFYF8f0NDtHPsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_041037_804547_C728DA3D 
X-CRM114-Status: GOOD (  11.60  )
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

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
> the latest wake up capable interrupts when the CPU cluster is entering the
> deepest idle state. This is done by sending IPC interrupt to RPM and is
> implemented as .power_off() callback by registering MPM as parent power
> domain to CPU cluster.

GPT suggests to register the notifier later, so that if
mbox_request_channel() probedefers we get a clean unwinding.

It also suggests to skip pm_genpd_remove() in the non-legacy
case, but the API tolerates nullptrs (although it does return
-EINVAL, but we ignore the value)

Konrad


