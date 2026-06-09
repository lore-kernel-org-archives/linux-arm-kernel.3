Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F978CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xg4V4XVPFGl1sJFsiI9GpGRx0QGGgthYiJp8Gmdz5BE=; b=UZFS8NkpoCZTO31iYlWyCm16IE
	OHe99Bixmpf5ACSnmjD0NcPfbBMFCNLwX0bUVDpjlKCFgoTOEibSVflO7X3ZYd0Ij4F4vwo2VN2mS
	R5/LMI/jPchH2+agY3aRUxaue4dW4xbZPhVIhQ5BJIyEAIp0/kmT+YqqpVI8RsbnCc+RwrX752w2Y
	BtDCGEFflv59B2NGWxKn14QYLoaxT/u73Gwt4uQG3fx2XbBZkrDBmywq7QQxPMVIhw292YOhgqx1W
	QlMJtwmS6J4Wtdj4SHs/+1yfW2c0Y1pVfCDL3QhxMqPzJ91sdoc2VogPrS8JK3CliqgvX3MdFxwJh
	pwS856LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzZI-00000006506-1LVg;
	Tue, 09 Jun 2026 16:44:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzZG-000000064zK-0pKb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 16:44:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOjiH2750392
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 16:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xg4V4XVPFGl1sJFsiI9GpGRx0QGGgthYiJp8Gmdz5BE=; b=Qs1uAAYitqroo6oR
	MEex2tM+jfALsKMXl4umzN17elvz1uSM5FrlKwfR8IqOh6Ya4uxiZnSVO0tbq9Tr
	QK481/Xt0zZOHbucSbNwg/ACKwZBYUILxpCm3VtL189aNeTmat06ophQGOxKEXZa
	Gs80R+I8O+HI3tCavUrCrRhQbyEg0mUr7VR6xgOLejbs8/POqlMQyKY4OabUupcN
	qNXyFBkCCv4abVW2RcZbqDqfvjcGD1SbntKqVZSd2/ex/8+nFOxqSpbZJvyag/Dm
	2sUVmlNpVRh6pxgWa12soJ7jCMC74ByJzUr2QOJ13cAC9aX3KRyypDVgEChjNt+7
	dEO9eg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqgjkxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 16:44:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2f1d1e5so3006002a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781023485; x=1781628285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xg4V4XVPFGl1sJFsiI9GpGRx0QGGgthYiJp8Gmdz5BE=;
        b=iIvOD+bDLnqEPs5vezuKOzzQBNkR80BITSnfW0iDo9T+yCXL1rzJMZdKmweZc9P6X1
         YMt/bQ2Fj36KdF+nigU4xnlprefZjYcjmi3aL7QLyM54iLz5TP/gsasTupPE1hvHY0+5
         8hItnkIV4HdDDP/Q/ewHUZnCOtNGGKWXIzNDr/RLxPjuNieAfIc7rByqtSq8GO3syvhM
         ct3FHYvvvtWeX06fm+O+ujFSoSh31gPsb7NhKNwWxq73JZFsmDh9U1NUzkXyhBY1MeVS
         7rYaZBiWNChgJtWGk880Nc3QkAS5JxmGRtTtdOdU9cK8JZCqzKOMBBXZXKOmsSzI8iwg
         dJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023485; x=1781628285;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xg4V4XVPFGl1sJFsiI9GpGRx0QGGgthYiJp8Gmdz5BE=;
        b=asTovOz8A1vomL5AjFQPfl4DIYDs2Ux0z/7/aG7weNWnCChTcw80f2YOg5lXdE1pGA
         4nyAQ8SdeBidTkbleNOi2jkTlPpgmVeMBdB2LmbukQTYunOTRzFrat7wXxt2Y2dRiflu
         s3Mzy76GiT63tq8SEt5JTwuGPMhrFFrHHgxiULPaG+gXkFn8tnGooVqG484Pts7FURLW
         maX/7Lf2lM3Wp9YHTZvPncff/LOOgbb3ogva5p89Kw3f7NJPkKfEudQ73ihXZwzNxT02
         4BMESCpkkrFpXuwfjnkuPinW84y5q0ZmpA4b99jV0pJ6O08MUjLkpXuUv5rafWdFkcXt
         iDEw==
X-Forwarded-Encrypted: i=1; AFNElJ/AJ/UXT2VDwAYKZHCt3Tnt+UZxoBhMnYFd3jDu/at7JiNgEqN9XCemJmYfe83/gI/3rg3MS6VUQ/cWqkKt3nL6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt8daJ7zXjX0pYj0dsvBpcQEfrNLlvfXDCLpznkXCFSUvBmQqV
	nDHNYW9OZZEvV9gcXLP/BJNQfSrYoTb4UHB9tuyTQyTCKZUibT0TPuQqnGns5aKd8CgaKsxhYM0
	kvxwGAK6oqkFkRHa48NuHRK0CSNxAaW6gHkUOTVCzU+MB1IFmZWd9PCj+vghCQRAtl1DfRaLcmq
	aYhQ==
X-Gm-Gg: Acq92OEgQu532YHU/+G8eVAAUJcHO0pJkyPuokr3+fNG/x5oz8qtlcX33sR4odLj0WQ
	AIqZoySIujt8PL4nSfb4WBORz+ik2l4CeX3c4ChvEZrWX/3anot/dXOQ7U0TeQovMZfwIU3Hps9
	iddFOvt5NtYyaMA3T5I/tFFstbj3Rztu9ZpH4yDbODnMDZhoiaVHUdkpv3WiPAwhmUCiOOTIu8Y
	cEGQJcSkc9zHl20e5DNtoJOb6oIH/RQssirMVe8fIDz3s5vDTbCTyra5WxtF7fOjgWPzcIpAsBg
	9+jn0YWMP88BdUv/3NN1EJFh+9Ut28fchsc0s9scObemR7ZH9fswsjPW0M5A7jqMorOfSqYDtkb
	Mal5MPcRRt+E4JSjZEwsWS6gaIHJTXHY=
X-Received: by 2002:a05:6a20:d505:b0:39b:89e0:2e37 with SMTP id adf61e73a8af0-3b53bc604dcmr5305652637.14.1781023484745;
        Tue, 09 Jun 2026 09:44:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:d505:b0:39b:89e0:2e37 with SMTP id adf61e73a8af0-3b53bc604dcmr5305599637.14.1781023484241;
        Tue, 09 Jun 2026 09:44:44 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b374fsm18673938a12.25.2026.06.09.09.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:44:43 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Shuvam Pandey <shuvampandey1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Fan Ni <fan.ni@samsung.com>, Shradha Todi <shradha.t@samsung.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>, linux-pci@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
References: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
Subject: Re: (subset) [PATCH 1/2] PCI: dwc: Guard RAS DES debugfs deinit
Message-Id: <178102347813.14565.586041970354711771.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 22:14:38 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1OSBTYWx0ZWRfX4CGrbj97DN7u
 5+S8CY7Smy2qHDXcfaRsBEgYkXJe2qalU+u4z+WBievBXSBGcsb05NKZvnB0fbk5uA7EwGI/pHX
 AbCFpuoY+xREmnXGvcR6vt2AY25bz99ekt/5+c32DnupO+p3xz+2JqzNjvK1/BbuYW9oy7UMaCz
 lPuVvtvoSQYZbo6Eaz3eu4ZA1lbQ49T00/6vHHDx4gB2USu/wZdk/IDysjgmpzqdc4y3FCLC0m0
 Zbjn2o5ux6it1r0ty21r2/3zFr5T7x374BpJ8X0e2cirFWMoi7b/R0NEPm2AFYA3sIgr3uKlvQm
 hOvWy1OvllU2o9OaKYJtEUezTRmK3LBCBBh33H2VjmSBlxyk4mVuGNtc76gwOLjowFwL9x9YrAR
 pcqVi2paf4P0yT6VewOt0fAlSLncCEkd4xciO+LsgOCtImtMjZK++DVru5iGxK1iajn8GINA3CW
 u4nk0DkmgfwPbaZV+lQ==
X-Proofpoint-ORIG-GUID: LFEDQ0t7FG0FW_hukkrJnYzhjLkTGPwz
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a2842fd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=HaK6AIl19eK7yf7b4pgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: LFEDQ0t7FG0FW_hukkrJnYzhjLkTGPwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_094446_334897_7F40D524 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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


On Mon, 18 May 2026 22:44:17 +0545, Shuvam Pandey wrote:
> dwc_pcie_rasdes_debugfs_init() returns success when the controller has
> no RAS DES capability, leaving pci->debugfs->rasdes_info unset. The
> common debugfs teardown path still calls
> dwc_pcie_rasdes_debugfs_deinit(), which dereferences rasdes_info
> unconditionally.
> 
> Return early when no RAS DES state was allocated. In that case no RAS DES
> mutex was initialized, so there is nothing to destroy.
> 
> [...]

Applied, thanks!

[1/2] PCI: dwc: Guard RAS DES debugfs deinit
      commit: a5ee214bb36f43b4d8bb2615b30d3b5c0ea80826

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


