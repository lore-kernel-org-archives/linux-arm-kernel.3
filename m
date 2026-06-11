Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13C0CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CQHC0MbxFBmHg37FSCWCdA81IJ9dxNyYEm4tKxmq0k=; b=zLgO4ttGX/zCDIjlN9dRPMeQ8W
	hXHTInetkWDi1CcLnVC7YhRYPWeoCV0wsiCJmYBl7/x8AVYEmNPSuRtqIusnN3Tx7UUOYbjGQ/eJi
	709dbNX3u/aUpt5x3yVIl0ScL0mt9ansHkNx6HKucYmhjO+PndYOr9Br26Ng7FZ8ekquGwROeBD7p
	V+TO0uxpRUbztN3hpNgd0EmfCmf52UZOB/i0cUDoorV6ek1PJ+peyqbqF4AbEfgZALH9RR0AOHlHa
	MlnVo1QG3+joynTFPzQjn6tSSLso9A8PKZf/C3S6eNH/YHq9G3Lx3mpsddFh7ktbAGEpBmEJ5mJPf
	LopY+J8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZip-00000008s0M-2awA;
	Thu, 11 Jun 2026 07:21:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXZin-00000008rzz-0X1X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 07:21:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GJ6w3843682
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 07:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CQHC0MbxFBmHg37FSCWCdA81IJ9dxNyYEm4tKxmq0k=; b=dWEHLAydlOKZPGH4
	R75aAd2/WsfaXS0KPXcpfxr1DGF4+ycrKWm7jBscvhPnNK4ExYN++Df4JdgEssLX
	diuuVV6eeLQCsX+eNPQQxarbcR84yl0RSgKtBM5MDCtLL580PUOS1bQH7RGrMXXK
	KlncibcaRByBFpbA2LT9ozR57hHdWzlR0TZH79dbSsrV65VEI5MiuTfho6xX6LKr
	iJMEjFM2jlkRgSvkARWErYw29zHYnrFRigtzLl1v/ReGg0uiepjcDP7+wQXDkA8u
	Y3nQQr0QatLyVo2V7lEWShv4Q4lv5ggkQdbqMoJoNCd/cAqFc6/lPAx94HyMbE8x
	tZ4FpA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7025ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 07:20:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2d65d9773so10223015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781162459; x=1781767259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CQHC0MbxFBmHg37FSCWCdA81IJ9dxNyYEm4tKxmq0k=;
        b=PqtBlpS3u6NgQ85n3f28LHDkGNCofVZkgpfCDuGQcmQLbzudxJifhKpws7vMLWbI3d
         DBm2UY0j88kwiZC4RkSuJHrjS48gbsMZFm59PpjvjdyvI1LWt+4PqySEqli16CRYkmuz
         R+fleipQKBl7wcoIJEoB+RpcRLIJjBZLa+1XrVtGTbWA2mwpnXqlteFph+N7Dy/Cz+Eb
         xJAwWAYA46f2EAViuy/ZACnhsSWob9FQDySA8Y+zbNhsjGqt8i0gXVCF+XgmPKQ8JWeA
         okK5EyOnQPQocJGiVsU5Uxa6Y5Qufn4CAYcSs6Hld2y93IM4OV5y/X0oJ3se/qLcxQkh
         wHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781162459; x=1781767259;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7CQHC0MbxFBmHg37FSCWCdA81IJ9dxNyYEm4tKxmq0k=;
        b=SCgVFun8emElrzOp5Ab2Co65dCTa3I1LX2N56inWWlqqXMsqMPGRUR3gOtfcGoo+KJ
         SFgFoGfF/1l8p+eqp9iKWhNEMm3FACVOzW/nsrL49nQamFVXoHSAi5QVAhvi72qkbf8O
         iL3OE7n+FBP4KSXS1iadLUyKljflhxU3ivcZWLjBtcyojwMHlP3FTvn9aHQ3O8K3eBd0
         pCx5eu4Xqaexl5jrF2UeFOjWuqs6jnkdbPQ9/psOC81r0xgQAnznGfxnSlOX72iiteBq
         dRslnXwy6dA9cnVQQxxpbw/0bg2NLTwhjgDoMpdspA76IVawpFPfoCHrfC5HdqRikisb
         NKqA==
X-Forwarded-Encrypted: i=1; AFNElJ/Uw+RJ7Gh5SdHDYJ3UQofhwbc+P7pExpxqtHYGwlMKyIgDITq+qCOGk3hmbp0j1OplHSKViZQk0zdfUcE4p6Hz@lists.infradead.org
X-Gm-Message-State: AOJu0YwjKSfiaIpSGhJq01MxLNBr4ySG4mR7D1a+dH9diuFu0Pd14Vg/
	aKY6ZYnEmgobA5FieTNDytcEIhPXMf+CsXQFgZtO/KpthnlYLcptXZ4iLH0RGbS9/1ahL7/vDh1
	zCuuVvOA+hgcrrOMOuVyN1ZiAHofQ/eP8rRWh+cG3msncVfUnxh2+KaNocKOvtZ0YqyGidbgMIV
	e0Mw==
X-Gm-Gg: Acq92OHG/JEDDOj+oIVTimBUxcM0RG+j09ZUi65RaWooSq01quDaANsDdHsMrplTBQZ
	ZtTi7oymMQgMey3b56/VQlCCQyw/03EQymx1n7tHOhwI3fyzEv4fkn1DS+cmIzVqbLBqQbSsukp
	rZfv11x67PXyEtJo0cIBumIFbMFbj1oI5xHXjtW7sNNUHVnI+po1n+a5KT4RK88jx14S8jxQusY
	kdpdohmsdPs0FxTzuhx0VUTwR3zc4oRIgR/MpXLXFXdjMHtMhsQZbXOS61gB0dGGKArfQOO8G6C
	+vTYXYQJHrMS13oQgzEavXXm60ysQKiokn8xuPPShk2JQ7GBZX7xD4mkgzt7p3VD4o7RV6r7sim
	bgXWmCNUHgeYrmj0/loB8cwLzi6I9zpI=
X-Received: by 2002:a17:903:4b46:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c2f22a9f06mr19126325ad.25.1781162458582;
        Thu, 11 Jun 2026 00:20:58 -0700 (PDT)
X-Received: by 2002:a17:903:4b46:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c2f22a9f06mr19125995ad.25.1781162458087;
        Thu, 11 Jun 2026 00:20:58 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.195.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8ad7sm145922405ad.42.2026.06.11.00.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:20:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-pci@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, linusw@kernel.org,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260526044016.1025613-1-rosenp@gmail.com>
References: <20260526044016.1025613-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] PCI: mvebu: Use fixed-width interrupt masks
Message-Id: <178116245413.8388.17772545908959484770.b4-ty@kernel.org>
Date: Thu, 11 Jun 2026 12:50:54 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: J_UjVSwHDVQ4CF5McUx_Rqzx-oXZdULL
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a61db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=n8UK4BQKCdfH/t0JQ2luxA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=SiPLVwNLmWBdlGvAHpkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA3MSBTYWx0ZWRfX+VefGx3vCm+i
 3oQEBfIjZPFc3cOc5uju3E3OJCSZI24IJYtj+XQpbmTtERrWe4XhNOnfXymQd/5abQ/fNymnZOI
 1B/fANAauhDle0QqsZzhlmkeG/KBXrSpxKJBweXzxTlGmOtlfHBXI+nywhFcMdpY0cWR/GIU5YN
 8C6CKFCEDFn3l50qMr2KImNpbjlQ/Uu52eypWStZ90ikfHiqmohL7ieOVjG0ZmNI7jaf8NMK0EC
 4KNXO6WS8jF4yYqmtCpDMJAuxLmBdpmxmEIOEmb/jSig4CblZ81kLBHBOGRh3QTCcJw7wHt9DYM
 5T6ovOGd1JCMUyVOcaD4q7i6txTCQMnZiS3IS3wQUutZrCZE51VgVgWTjO6LZ5/4dGbXUXzFhZV
 6zCN3EMkVPH+h44sxxVw/YjwaQzcnzfow38h6jb01GqX91YtWwIrIN5Qa/3nlcSeQ27BeWK+eDk
 0qLNgJDMiwBWpNBovWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA3MSBTYWx0ZWRfX4DF017dwDO+e
 jA3/AUMIHnZJgGMbv5Q+1ouZZ9vGKvj3YbqTGyuWgZDgeb+9AOtLmqhFavZWc629NV7N7gyF5jQ
 Y0jLCduU3t1jjtEUqTlccX2PNysNC0M=
X-Proofpoint-ORIG-GUID: J_UjVSwHDVQ4CF5McUx_Rqzx-oXZdULL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_002101_804245_DAD2E390 
X-CRM114-Status: GOOD (  10.20  )
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


On Mon, 25 May 2026 21:40:16 -0700, Rosen Penev wrote:
> Use u32-typed BIT and GENMASK helpers for PCIe interrupt register
> masks.  This keeps inverted masks in the same width as the registers
> and avoids truncation warnings on 64-bit compile-test builds.
> 
> Fixes this and similar warnings:
> 
> drivers/pci/controller/pci-mvebu.c:316:21: error: implicit conversion from
> 'unsigned long' to 'u32' (aka 'unsigned int') changes value from
> 18446744069414584320 to 0 [-Werror,-Wconstant-conversion]
>   316 |         mvebu_writel(port, ~PCIE_INT_ALL_MASK, PCIE_INT_UNMASK_OFF);
> 
> [...]

Applied, thanks!

[1/1] PCI: mvebu: Use fixed-width interrupt masks
      commit: c525508c1854e72b080b49e6ff7074913dc1905d

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


