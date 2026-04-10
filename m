Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C224F44852
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7JfgNFgkKW4H7JoASIxg1ajm0fFfi1AnuywvMp+amY=; b=M0pkbog0dXAT+JNlBNwlkl2a6o
	i1IMz8qWl0gTA96YNMaq871nxY2dx3mR/cHvGxce26BMm7nFI6xcUJn4bBCZ53fGZZ7jx5XsC4Zkl
	kS4cuvQS0N9LXJyfUi3k9kWttIZ9gLz97M9jU+z7vnL2uFfrTt2W2u/WeyqWkax3J+BzQLT4TOvvv
	wb9XZoCIhW/F6qXhcAhPU2bt2HWnhDpUcDcY0F7oIpkV90vJ0ojN/qeozK63+sXV6AlTwyNYvmzJ8
	vhG/79P9jpUfCIo6F66UhOGqS5eZ/LM1CCQTGtG5LLfMdKMoffbz1osQS9Ge5EhCqtHYTscunEGH0
	+5mMHDNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXz-0000000CHfG-0zIC;
	Fri, 10 Apr 2026 13:05:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXw-0000000CHdH-20vT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 13:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=q7JfgNFgkKW4H7JoASIxg1ajm0fFfi1AnuywvMp+amY=; b=FzWC13fQOuvpLsHvKloH75tXqJ
	UsONUfzGqCe2Ui6cPWwxCUEFg9ZWT1Dq6bTKjBmaIEOJVo5SD+uPGDT/FqS6677QMiDsWgRfdOcVV
	HzCaAVmndGgjT5Lg1Ygelrmqb1DMWvxYhX9fWgDgU346JVfyYgf5fr1SbHX//AqZdiVFy15UdbGNU
	75ZMbVK0W7xlBlnS0Ld6pA2T9n4J10cEJGEzTFvZAz8bo1r76xku5OVQ1upmDavPen+N+Sda/p5KD
	cqW7fVyHI07uu7Dmt8/X+bc0xHKUJBdk8rgsl3jQw1nNJ4P6YNzCMeiJEnW40SBimZsnbW+omMRAm
	qoaPxCiw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBBXs-0000000DXHC-0OT8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:05:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA5Y3b1498589
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7JfgNFgkKW4H7JoASIxg1ajm0fFfi1AnuywvMp+amY=; b=HEntjq+1sqbRiIcS
	uo2x/RVZFJ2YqfGBsnUEIWP67l3XfJhiqZGsdL7muNCTVJ6lM5A29m9a+PGEQMmP
	1rdh7eqYjK9gpCBkCgEseXoaTaZzU0NODe2JRYKoA3lc11wCEwGmgXl/ua5vROb1
	s0BhX5QbMGRNcSdHm+R9PkEZtymwU5GDiwPP1c3AXqouHhVvgZorcKK0mKUDClGc
	e5Abvk4u7CtA2j8tpSevsRpVSLZIzlfc56S9Rj4ppJhBmgYbokgvpiXSPU5iiOaB
	TBSe2PaDfsm1e2/kWmzhyH6WUTaYLb1poud3zEE3sfOxuJItuyMDkQ/Y1EKupPbh
	lGksOw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5b0h04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:05:10 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46335278e7bso2699608b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775826309; x=1776431109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7JfgNFgkKW4H7JoASIxg1ajm0fFfi1AnuywvMp+amY=;
        b=H/x3oCfadS04TSKCcJD+rKIlhZ0gAywAuFeWZQz/mQ9sVq1DpmGy0/zE0i26SnG36n
         vrHLQ//SF4gOyi6xPWoYgCtpWVFBHqcRR08VwRsKsy8KzkhmEN+/Aj1Nsi6KuW8rkWJ8
         xXJPxwW7RY0bikFjByoYw4JxQJDNokOw40CIOiDllvkUp8hqQ7P88fa/PvNrRDSq7RP2
         2HsEEZffr2hn1NZiu+ArwMxF6iA7tv5uKnvQNi+FLujUtTIDdle/NHZcc4eMRc8HxE8w
         KBrnWBOipt93E0w6tBM0cAk3WQvHO8R4+ikIh7tsaGKbPkpx6MGyW8xPf/ZFuhyE0jM/
         1JzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775826309; x=1776431109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7JfgNFgkKW4H7JoASIxg1ajm0fFfi1AnuywvMp+amY=;
        b=NMMuzD0zZYXKen/s7c1qnSfH4OdsMgQy9u8hpBRRODhzcr0v54F0uaFOQXi4XZzZJJ
         hvX3VoGIVXwXKvdUdGsMMo6+4rZbnoxQaMzRYZUATkEOD+ivruCpjRFUxwjccYuuHzsM
         Eq/lHFLOkVMEfI4bvNuDgD31wx9jT7/XU0SPmiHjXCLztao7++6qFeZLZlugZg1KXhrp
         d6koKCJO+hs+qdWXdhSVslyBqs28dpyBfQzMgz6aO2CaW3XmrfwlLpjQIB/WdAHeuGLD
         +M96EnMz7Fq1v6Cw99KysQBbex6+JUVfM+zCxgq58E/Sz4tM8cYYX0D7ZLDe0uCIG/bi
         LMsg==
X-Forwarded-Encrypted: i=1; AJvYcCXYw4KzpV4knyTTyMELwswi1zzy9NeDLPQaxwcC+jle0ee6/IhKAf1mQK3pXNBk61RSadW8g2LlR2GAYHy5YXNp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv4h4Ql0VzkXvo8CVoNnAeyDxW+VEuwcNsB3ZEIeBmDi6StWIq
	LIaQ7LKeOR5NhF290dNgFMIdhhI/vvWQ/GoVb9twWrUB3D2JuTQANsOFDVu6Bewhps0UrRol03c
	hLsTrV2dkYK7XlL+38+R4VZOsxbkdUPjWd/0PcNhpWHqMN4k00lz1coUx6m8s8GgGoQyTEMP60r
	eaFA==
X-Gm-Gg: AeBDiev7i5Y23Jb2fP3Ny9KOUHtz4CEuzWH8SdBxI8y6RPs/iYKKkthTUGRLFgM5X/W
	sV1MQgLbijoInEpcact6Dz7LjJSwHlyzDZEiGZ6KWBXVQUsmsNU4gRsGKaE7iA3DJqeP/PpP8DB
	68P+ACrZPjbznx3c1FSHf4FS+B07J1Blo0Zhy94EpqHV4wLGW4dhsVY76i6AMtutk/sQsYRCoka
	tnoTVEF4CzRJZGIjcWIW8FC+gWhf3Qu5fyIUm+nz33pD1UO2kMk/u0Cti/8rClTwstSNVLPlyzf
	OrrMvmpy4sqIxV9WkkoauzUc9LlEVXDd2ZHE3QF7tUPReHXhV4Jlj7r16anPb8PTLDkBSr+BIYd
	/yA6uEPrcCxvZ2GGxvx+W+OhUDM+TF7ZdhgZWkewHD3Ll
X-Received: by 2002:a05:6808:1405:b0:468:bfe3:17b1 with SMTP id 5614622812f47-4772c8a4eddmr3232827b6e.23.1775826309281;
        Fri, 10 Apr 2026 06:05:09 -0700 (PDT)
X-Received: by 2002:a05:6808:1405:b0:468:bfe3:17b1 with SMTP id 5614622812f47-4772c8a4eddmr3232786b6e.23.1775826308625;
        Fri, 10 Apr 2026 06:05:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63dec07esm7694865f8f.13.2026.04.10.06.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:05:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 15:04:57 +0200
Subject: [PATCH 2/4] pinctrl: aspeed: Enable compile testing outside of
 ARCH_ASPEED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-pinctrl-testing-v1-2-6f708c855867@oss.qualcomm.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>,
        linux-realtek-soc@lists.infradead.org,
        James Tai <james.tai@realtek.com>,
        Yu-Chun Lin <eleanor.lin@realtek.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=959;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6r2aSZnVyktxNXguIsqv8rbhG8kjpenHo3yDdPaubfQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2PV61KfuhzaqJkBRUg6EXADQNZG73hNSQCFms
 G4w2C0D/qmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadj1egAKCRDBN2bmhouD
 17b3D/9PWcOZ2o477Ut8BBdIYGaAxfj58fvHa+GCDp7OubNgeUWJVxzn99NDUAqMjjLSBqmhwuo
 d6ZiQgytlRcZH6OIyBhZB18jyPYHVGAt2ObEd4z8pb17YWwjQF0tBfGf2aHhXkAB1wrqnzVz8Aa
 2prJ+T6UCeKlDGqCSoWlSeKuZPI3vtWTsC5L/YmzAk83zY6jnIs/D2SKwnpKn/LhRiTOybAl/W5
 8PfuM9nIY2oAjBNGVik4v6zy1urWdB+3S0SYVNpBgGUXfL51BE1KSauL0Q6HPMq7Bmipk9azf/N
 SUBY82ia4Kv6SUsnSGhu+S93l+KsuQKefpkhPCIilL1THCLFvf7HmevNYLqnlQqL1OyjDhCvQOW
 Tv0FAuN4F8bT0D+71c0+4dKwZolTgqDlWpYGi7jiUSLKXl/Sb2mpc4vNnEoW2bBz37gyZkSGCdB
 0GK4+eOWsq71afa4qJejJdkQHZq58l7rnFA/UD4uPaHpXGbOUwjp26eDho2l+SiYEZMB5qbqjtc
 EHw3x/t5zEJLS56fKaUU4TxwRLNImBc4Dy8vmlQyWYXdO3z80dzAfob8h4n9s88dNON79/oITKL
 tCB0DUtIsLZq78Kb0UB6Rr8u/oGJJQTD+/ibJblif3FGMZF1+nqR6cFIuX4Lppc0Sc2799NZ4pQ
 Pt3C4Hf7rccooGA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: NRSsFWNeu7SAtfE7G_XeeHrxnV3s6DGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEyMiBTYWx0ZWRfX/uTl1xAtBnhF
 3x1sUwX3j8xZOE+3x0kNeLTnenfG1n4qr61q1dq8mu+O64P+qXsI/XFu9D9QGh07ghluaPW839N
 cVGejS59UCS2D1rvwMWOs10fgHXQhu5/RY8xqMimZcAQun/Mu690HaiZ3Lhe/HHkRAuUNqDt/6U
 2oCnlL4xAwenssTf7zmWPyBI/77KmsDs9R+w6TeG9PTppJFv3SDgnMme6C9fjQiPonvHWg8tg6A
 eF3dVWQBl2rfllNdWU79F3Y3uRYBn5vdl3oKoS55E2Tx/oQV4mzEwuKduC/LDP7KgQ8e/lrOUae
 4lmXmX/MPM1dHGVqatVzz3mpFT0VC+qwhzIQ2BdIueMCqkSBjUs2dNMLW5UPT/ewbXE+E/n1eK7
 v30Yc3mTFQmgAS/xLRqQiq2amCPgDTrIUS/ri6GoFaGjeBsyLAOevYYXSwsB1/b+Husl8mLIJ7r
 pp/NOwE7SAYtQV+gx4w==
X-Proofpoint-GUID: NRSsFWNeu7SAtfE7G_XeeHrxnV3s6DGH
X-Authority-Analysis: v=2.4 cv=VsgTxe2n c=1 sm=1 tr=0 ts=69d8f586 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7VIysbvwOnJS610hwA8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_140512_509480_5B63674D 
X-CRM114-Status: GOOD (  14.08  )
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

Since inception in commit 4d3d0e4272d8 ("pinctrl: Add core support for
Aspeed SoCs"), the Aspeed pin controller drivers cannot be compile
tested, unless ARCH_ASPEED is selected.  .  That partially defeats the
purpose of compile testing, since ARCH_ASPEED is pulled when building
platform kernels.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index b054cfb99348..9320ffae5f31 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -66,7 +66,7 @@ obj-$(CONFIG_PINCTRL_ZYNQMP)	+= pinctrl-zynqmp.o
 obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
 
 obj-y				+= actions/
-obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
+obj-$(CONFIG_PINCTRL_ASPEED)	+= aspeed/
 obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
 obj-y				+= cirrus/

-- 
2.51.0


