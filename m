Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09C5D68BE0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 06:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjYhNKTKp8oFFQ8K5luAyAyOx4SBt2zoxQ2yTKlGYwg=; b=e4IsE6p4VFAu4aAG12H5Wb0bAE
	Z88AZGvfnr9s5PdEr4P///4cSUhcrdNFq+LceaozNqrRJJbuvnblEJ4yElYOkpmtYny/qmqHSJzeH
	dJ6PHQWaIiXNDAJjTQ4Ty4yhlqVwaQdco0/20RU0+nvRFRvWONDTx2+JIVMB1SSlodgcPXyjSb1qp
	8hZoSCyynV4EJPy06ZTUiG2vzZl1ev6BtkEvnzm5NPBE8ceIufGKozTEfn/LeJLIWYuhHmhnjQBQU
	Jalu+nppNCfRRol55nP61ZSF2Ql0Bcm2kFdIY9Wwb9KJecLUmBKKzt678aVlzx7cCYT7c55AYXdnq
	4079hKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW79R-00000007sGU-14j3;
	Thu, 18 Dec 2025 06:06:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW79N-00000007sFl-1g8x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 06:06:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1Zjhx2016404
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 06:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjYhNKTKp8oFFQ8K5luAyAyOx4SBt2zoxQ2yTKlGYwg=; b=QxCecsCm8onLOGsa
	iYRpZfZiryUV3xxJbjbOgke0QbM4opxOYcPEVwXZJV+J6iQ5c97vIfoDKSbkI1Lt
	PUXNwL64GTt59o5LufgUq6mId4uitv+4lZG3M2yFQTpMh92fOQRIpfCNhUjUwXmY
	OYYqlDwA6dz5gZ0iY/H/SIUldhAK2wEHE9UpBtxf2ml4sECXDmk//C7vfztHgOt4
	zcGfiXqtvMO2cdgttRbkzci2Fl7b3xK+RhKuNIzFU6eMiyq4SHd/3rdwilaG96FD
	HqMadCIPCzg7+MgNBYuMMymq4DWITBUljMrXgJkIT4hknAFMA8cGLyDZGTcW1HiE
	ZxiLmA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e3am2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 06:06:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f2381ea85so5891985ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 22:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766037966; x=1766642766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjYhNKTKp8oFFQ8K5luAyAyOx4SBt2zoxQ2yTKlGYwg=;
        b=BcCzQgIpdCadQ+2PKVdWgScp0Cw1JP8+buIQZZ3xbUK44p6WFvp9A/Ie+lGlXLqj1Y
         +URNTY12rna1zRxiAFfms5g8ZT1qsMtIc2j4RZuFsrRNZa6f0PUk8IPNY9R0U3C+Ap9C
         TrS8ZAk0T3aEqQ9oLyq6k3AOX52ZjkO8NQWAcmRH6j6HMZFP/b99PWFkZgiSzM7ZjaQj
         gzHtScU6/jzJZjeeWAotgJ87Mqudy3V8qOHnA8YdkP2HxctTbk9bL3X44CU2PJWla141
         JKcj+mEmQuYdD3UW5ooX/rZm1CzKJK1XF7VaTgs7lhty8Oxx+iTmTep7N3xIV4DMy7ZR
         EvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766037966; x=1766642766;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MjYhNKTKp8oFFQ8K5luAyAyOx4SBt2zoxQ2yTKlGYwg=;
        b=MXFLH+uxyZ/1ziAB/lPwI2m034N2ULCWnokhH0yGAF5JdGsZ/iEyImbPW8Faaf1Gmy
         tQ0XA9gC0EC4cFemnNCsDPrFwntBX0Z5iLl+2qgD5zDCVsFAZPzDK/5Mo/+YYtmQQChi
         B1k71h3sy+rVKvfWvmtN3I9G7mNRq22hvnmb3x+FCfte7WpPyCdPNciaQCP4/euNvxQp
         TKJi/+4r7h5qaTkOQdPBmBlGo0glIZYyy9RVvxn3LYeICvc4WdabgnggHWjFHa3JNXEJ
         GKRPjFB3r1qzZypaaQvnpZyRvjWYz4EddfnWWT4BRnh3Le4QjIY0tUq9nNgUvxZx32TN
         PUqw==
X-Forwarded-Encrypted: i=1; AJvYcCX81mFwXuX8CHHOsq8j0sNwK/ThWNIvgQ2xYbrDbua3ZBMfGMgOhiKQP+9qQfxZfBUTMHgOcBZC7kFt050BUkoj@lists.infradead.org
X-Gm-Message-State: AOJu0YyZRsINI/AESYdqNeUf2UhMdz5aSoGs1Qao9vMT/Ajd9NTBlreQ
	CNbd2co6siFi2gY0PZNqHkmeTOQ/Ib+BMHyOSPgvhyiea66IBtfHggiqxXdJil3YiynfZDStUEH
	8PoRT7GfCIb8TRnIy3WAfJVgqzRIvWfpRuiMBiQqBvK5p17y512ohlfunLpmD9kScz/Y4I2XmV6
	cQyA==
X-Gm-Gg: AY/fxX7W+qEgI2s0860UiRGW89UnIyomH2omOEmUHsdZtTLxU05dcSeRRGWNUZ29h52
	a0glCYCPwxF2tKzmySX6bLKpKKFI3IM0HxcAsX8Zr5HKa7cq//cW4NZj19leZGHGd9QsSpyWe8n
	FgTTAxN6yn0y6LoO/bPQV6j5wHO/qOYx2Goe7e3v2EfAiX81IUC+TEJQb4LrwkzQcWqGHLF6/h2
	QTG4glW/PGZfKznuSqpdRSrfVO32FpOSs8kfLStr/1fHSE93/sxoa3w1fjY+iIIi2yhJ/f95288
	jj2b81VH91OMn+0hEoIrLZ6ZIh05cTidS8Fe4KBZ4gZsc2mZ+X2U3tRUTa9vx84HXmvH8UA3JWP
	pjzCx+De+i+Y=
X-Received: by 2002:a17:903:1a2b:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-29f244aa9e9mr223285725ad.54.1766037966505;
        Wed, 17 Dec 2025 22:06:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXtU/Jq12UVhDJn8i4aPL9g1mtUoYuWCktraOpSdZBnZjjtbDml3pnPWFQ9a/qS+c2uVRDxg==
X-Received: by 2002:a17:903:1a2b:b0:297:e3c4:b2b0 with SMTP id d9443c01a7336-29f244aa9e9mr223285465ad.54.1766037965984;
        Wed, 17 Dec 2025 22:06:05 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe13d853a9sm1307489b3a.42.2025.12.17.22.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 22:06:05 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Linnaea Lavia <linnaea-von-lavia@live.com>,
        FUKAUMI Naoki <naoki@radxa.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        stable@vger.kernel.org
In-Reply-To: <20251103221930.1831376-1-helgaas@kernel.org>
References: <20251103221930.1831376-1-helgaas@kernel.org>
Subject: Re: [PATCH] PCI: meson: Remove meson_pcie_link_up() timeout,
 message, speed check
Message-Id: <176603796183.17581.9416209133990924154.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 11:36:01 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA0OCBTYWx0ZWRfXyjsIwXrYZsBv
 yXPgJxRWdutqQBB1Ms7QKdkCqOj9F1Ypq9OcIEUFsCo3dowmk+5H2Sk45vtkffbfkThhm6Ps4L2
 z9OC0ov9swTYk8qGQ4JfQitxNwi54TG/DrkSZpkmRixglo8bLDZsc0McTimvgIdbCNR24b4C/cg
 E+cmGVxBazQ8ET1d7FSzGa9BRP4HDTN1oJBGokP5V0WwjCHJBBlE8qS98joXlxEivIQ5JUG1DNJ
 niit89AMeevPhYaifSiL22gcQa0V4ALNJqZS0aIJ9s5ttbW1bjW6JbYaPyiOc4YZf6ONWNA/nZ/
 9Ne1QcSUWlx2RiknN/0l86RUjzBd6zkUd9RXmDYT9zgSsgkZ2ug8gudmZ/CifSMB0RTZ9rBPoDB
 whLr2/7j355J8oIuO6CqPuvV+YFn+w==
X-Proofpoint-GUID: eb0EiYyTYZioE169WmaWb2Y_qQVo9DeM
X-Proofpoint-ORIG-GUID: eb0EiYyTYZioE169WmaWb2Y_qQVo9DeM
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=694399cf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=PLOdWElDzbaVVj/XHNhp9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zrTfyjHbw98hyAFYeIwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_220609_453866_B4F20E77 
X-CRM114-Status: GOOD (  10.75  )
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


On Mon, 03 Nov 2025 16:19:26 -0600, Bjorn Helgaas wrote:
> Previously meson_pcie_link_up() only returned true if the link was in the
> L0 state.  This was incorrect because hardware autonomously manages
> transitions between L0, L0s, and L1 while both components on the link stay
> in D0.  Those states should all be treated as "link is active".
> 
> Returning false when the device was in L0s or L1 broke config accesses
> because dw_pcie_other_conf_map_bus() fails if the link is down, which
> caused errors like this:
> 
> [...]

Applied, thanks!

[1/1] PCI: meson: Remove meson_pcie_link_up() timeout, message, speed check
      commit: 11647fc772e977c981259a63c4a2b7e2c312ea22

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


