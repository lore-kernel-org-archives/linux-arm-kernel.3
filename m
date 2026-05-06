Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF50CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B04ufWVqQY+6LmdWlDuU/yPADhaacVQQXruDPNi3DH4=; b=WzEfvRTafcheSSiRmSr5SnwELi
	zmS2x4HJyZi2U4M22NsU2t9e0W349d2QuU53OqbzNMFV/Cu5T5IYc6VcBAM6Fb52mcnDah99CMa5h
	Rx32MY9Ei8oxVs1IepAfxJERH0On/+w1O3MUVhKUZ5u384CdbRb8T7clFkTBm+YkwnmvNN3pVcub3
	DA2yIs4lymMjgAnEUK5w6PKhrUivWlt28uhdw6osbgjElX+B2JfoE5hAKnkgX4Eh9YLg05aeNWTLI
	rtLzCChUXtm9enxizWMEsMxiQszRi2PszzxQ6E8XyITEzJdAz4qmq1oYl4xCc9YgujpOMmrdLtjNt
	3gOrwZ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfy4-00000001dOV-2DTn;
	Wed, 06 May 2026 17:23:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfy2-00000001dNf-3Xql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 17:23:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646D8YTa1527956
	for <linux-arm-kernel@lists.infradead.org>; Wed, 6 May 2026 17:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B04ufWVqQY+6LmdWlDuU/yPADhaacVQQXruDPNi3DH4=; b=dtKfYPNDgtiz/Ojf
	jslK1RXwmB0+n4brSNcJYr4NLTQN09qgPBG1K/yMJb8Ra0tP/RBkBssiIBeKA5Rz
	avobxVVZ+UkS+HT1vsxFTPF1oDcvWchN0aFFJmAgyXYzDwLy6//byia3pPitWL8x
	P0Fme9PnmtRr9WpPcLUY9YhxhFjhq04FFDqECZSG7lwdQentgVV2y+iMJ254DbrW
	89OIMVxNyKhbVeBqL1A2V7x0PTc6C3oQZ0/v8vmW1NghzxOJulUoZz00dntROLMC
	RlLKE3LKXRwYIakQ8091SYmok0lBFYMmguwpxdMOCtGwlFEzd1TRYe9nOAUYta8m
	vlRywA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0128acee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 17:23:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so6652555b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 10:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778088205; x=1778693005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B04ufWVqQY+6LmdWlDuU/yPADhaacVQQXruDPNi3DH4=;
        b=HfMNQihUg4P1a1mDAmqTq53R92ryaD4lKqcsTgKuHbO0uYfx3K7YaoCg3U3+bYqiH4
         kVRftM2xnR9zC29KUWn/+We96wBNlkVTIxV8hgvPJnFbQx+A2EMxkVK+MxRNqyZ0XeMp
         73mNrMGheNtLAB8nrzOgx/FzNbPmfyR2soNTGImzjGnk09X9wXKMYEDbT6zS6/2/oUP/
         GdLogijuibvUvEt+89NnfMgRs6Quvpq1zMsCtqh4bVre9DMVilvj39e1DNKaIOCQxAGU
         MhCzZ22cMPoVjh2Mleak8zedHXw9W2ae6rvEp/RBnVDngz12m8HS7Kdzm5VtI71BKUSz
         45Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778088205; x=1778693005;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B04ufWVqQY+6LmdWlDuU/yPADhaacVQQXruDPNi3DH4=;
        b=bKbrYI/zta/UTOx+23b1tg+rmAkqlZ8ugPPpdqd/PZ95/TbR8t8ha0lmfvIQ/dKuXT
         Dm4g3l7wH9PG0lw5G99IrRK6TAuE47m3bf/NA4RVO2U9kaGfzQHeeNpf2KrbmlV2V9NN
         pSZn248pJnFEe8SzWRnx3BbYanXfki/lrI/TB6x+AgQEFb9eJNUt1vFYnP5Nirk3Ynr/
         RUVWaAePoZlnhg4ePr+0aqSrZOTZrenwFCumDucA0jrz8o+TBDlj1bN4cM0LX2tUXIUO
         RANrBxOFfoe/0yybr+4w5Ev8glRB6NwIxAzDkL/1MybBGxVhbRzq7YyGQ2u2+y769b4A
         mQvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/48OgeJCJ3WhjHplpDkvFboXPgH3ap8V9c3AuJJYOE4ZpPsRxJUHsxqlZ1fxSwaID3lfdfybleZ5YqNh3Mi6xk@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9owr8NslTqRFI3nTeQHIbt8pC4EwYMZB7ZQ2FSXyJynSxR88T
	sl3o0Bo4HS+WywkzG676qH+UVx2sMZenVqwNdA2v9s/1m5AXd/JjCCs2vzy4vvicnEbRsbEQuSA
	2FSpU0zYutCA0Rb12fyn0IzfNCd7IGlIezeUeU8h0jo6J8hy2M8yphLf/LXeQPF2eeyIiB1b2oM
	nHJg==
X-Gm-Gg: AeBDievfKYv2QiA/p5ztHxUikz/lOpLqx3NcOYQQIDFboJmuXEAL6qwbYBYo/Rzwpso
	7jeMiGy74vQ0YHSRyPJIvErHluOeNy4EdFU55jxCIFrU8f//JVuhs/RI2HZ1F4u00DSS2KhF1yM
	T305yqHgLEDnK8LVumde2zIZZuhr5b659bqXQrPSh2R1hkSht6X7lzWGjPJv26PZQSiHrh7SDrK
	54FoNE6s/1MkdhLaKK6pDMYTc9f470ZB1bOFQzj8LdcoBdJFtDFgnBlz8x3x5D7mW7pJw6WQ2J/
	N4Fj7NmiSLeP2trCwdrt10Ur8wv3LJo0iKYiHQavLivCtaMapRni54kj7V7MLQMVLDWYf862d8A
	PBerADGJFCWZx3Hz+t4SBankDazxrGZM=
X-Received: by 2002:a05:6a00:a84:b0:838:ff63:2fe2 with SMTP id d2e1a72fcca58-83a5bada1c2mr4397779b3a.5.1778088204474;
        Wed, 06 May 2026 10:23:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:a84:b0:838:ff63:2fe2 with SMTP id d2e1a72fcca58-83a5bada1c2mr4397719b3a.5.1778088203868;
        Wed, 06 May 2026 10:23:23 -0700 (PDT)
Received: from [192.168.1.102] ([120.60.67.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf0cesm7878077b3a.46.2026.05.06.10.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:23:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Sai Krishna Musham <sai.krishna.musham@amd.com>,
        Niklas Cassel <cassel@kernel.org>, Koichiro Den <den@valinux.co.jp>,
        Hans Zhang <18255117159@163.com>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Jingoo Han <jingoohan1@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
In-Reply-To: <20260506084858.867884-1-andriy.shevchenko@linux.intel.com>
References: <20260506084858.867884-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/4] PCI: dwc: Drop or replace unused linux/gpio.h
Message-Id: <177808819839.13723.13307063547924502417.b4-ty@b4>
Date: Wed, 06 May 2026 22:53:18 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-GUID: JY7lD-nwEwj75uESN1MI2kE4HrbKhjyo
X-Proofpoint-ORIG-GUID: JY7lD-nwEwj75uESN1MI2kE4HrbKhjyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OSBTYWx0ZWRfX0R8gRJyqOszi
 sHwLorw5lhVwpPKJ8cm0ar0ohEhv3N9K0SAcgRuSo0cB7wqC92VToqQYPFx3D7jMYZZLtznP8Y9
 f/2ZObgjfWrfQnSgM5Z/xXkL0XJV4CV/I8WgATrjfcv8m12qxYhTpY7S4JtHwir/Q7y8b+H7bks
 SXTITERZ3pbFz3NMBl1ZMMEZO+xmrAW2+/SwTfbhElSpjoCoJtwXCP08trKp5sN+wfF0lLrmJXf
 a93OEdNt+/SJcZ+7CJYn3rPp/WVN9ovGCARtO3llbnusPN47i+jUuBMS7AaftyMAzpjcZ+tXJHS
 hnW7J2uQD6P5EtIq2X09uB2yK4LxeOrz3wUvqi5w5cGaM+oTqVLZmRkE/J8u2foSzVx1Q+SZZf/
 CKOBJCWLb47rs57BJGG2FLe+qRiAru7EaLwv8Xb1wtSIKWofZDzvj7iYdfXH1qPImdmg5iggst6
 +HdgOhNNb2Kj1zzplAA==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb790d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=SQtj7D3ryojUavkWoQJ0Rg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=qQCpgmiq-wZ1PIn7dQoA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_102327_109313_4E102600 
X-CRM114-Status: GOOD (  11.98  )
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


On Wed, 06 May 2026 10:47:23 +0200, Andy Shevchenko wrote:
> The <linux/gpio.h> is a legacy header that is going to die.
> Make sure that PCI DesignWare drivers do not include it.
> 
> Compile tested on x86_64.
> 
> Andy Shevchenko (4):
>   PCI: amd-mdb: Use the right GPIO header
>   PCI: designware-plat: Drop unused include
>   PCI: fu740: Drop unused include
>   PCI: visconti: Drop unused include
> 
> [...]

Applied, thanks!

[1/4] PCI: amd-mdb: Use the right GPIO header
      commit: 8d846a0a6f95cd717df892b077a1c990a86b29fa
[2/4] PCI: designware-plat: Drop unused include
      commit: 800c861cfcbedd033bdffa65c00188fefdcf0767
[3/4] PCI: fu740: Drop unused include
      commit: 71d007f6fb17f519c2fe51d35e0bee5f602169e6
[4/4] PCI: visconti: Drop unused include
      commit: 7cc21269ef74269e423d64defc940808ccbf9774

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


