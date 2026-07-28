Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22498C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c5fc7ww9/HSIAlazJaxeZxfMvt8Px9TwkVtADywhlKI=; b=GdINDKbOc6Qlv3
	v0dds8MH47HAbkSsD8+B+17mKHtlKUBBQ65SrV8DpbozH9SWVprnGuFe2ZHqzaqkIG0V/5Cqtu3OK
	GApLQDgFZO4kdJNcjsPeh/M9MQwkSRcsMm9WSlOsiivjhaaRLJjaRnLT3j3pGv2eS7ZFWT0zj6//c
	kVBHcmTMDkNHxQKjXyY8Du3YuHcXo3ldX2JVtilfQxaaicenNr/IfSzuYRqh+vMoAVsy+UBLzVnFz
	qyHTf+IacHCUmWvlupxxJ4BfuLV6MZfb/6TQABG+vTTAxJy38RE9Dh8cDIPd0xTRPIqEwvZPjEWHl
	rlxKf9DUuz25PM5xQbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiT4-00000005Qdk-0SwZ;
	Tue, 28 Jul 2026 14:07:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiT1-00000005Qcx-1ptB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:07:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDPLwO2898719
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c5fc7ww9/HSIAlazJaxeZx
	fMvt8Px9TwkVtADywhlKI=; b=MXt5Cj+z6FZRE+LpyaUzwfxitW/j0LjVYyxKs4
	DDqMKo1zwSgiH50T2yVEfn4SGoIHMoxjITNCxiREmOyy/UcARh7500fpbF5Wa1/H
	4pBb1LLK9zY0BIHYT3Z+XRWMgqGSv0kF0deFZhKITBkBXbmgCdJGIxKM8e5yAyE8
	/3AtAgTA/r7TVldQlIFwpWmPvr/sxpNT2oh6g1UYW27kK5WOrxq2AAWgaIdkMtp5
	BPDA0VzebnbQ3g+rubBepsc6Udx7UKGjo4nE8eBv/iiRBpLN7GBOSenAbM2nm5Sm
	k5E4MoMis0lq7S2URTUmY+7RMOUuMQa2nYbueyOkqlTmuLdA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19jdc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:07:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bfabbb06f6so462425e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247653; x=1785852453; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c5fc7ww9/HSIAlazJaxeZxfMvt8Px9TwkVtADywhlKI=;
        b=D4/tpTTsjbygWBXqEwnfNtFs96p7vUq53+fQo0TKQ4qk48cAd7HguZGMThlal31FmS
         m9F/3IvksELRSAuxunGEnIZxxvSLNLSmgIdSMktECgxrRrbwZiO8wwQg7mIHpYamXH5I
         YYaBnztgM2qayUBn3Ecb+JW4VfOgJ6hk3isxBSIa5UtvpO6fZwEdOQAHw6hdwTVlb1Fu
         OalQXogg8ZtZEW6mWrvydfdD//HuMMvV+DI3pg6ynEhOSmwE7MAHWssK8PciaaY47bNY
         +vulSCGUDEdQBVrmnkPLdQgCdZy9C6QirJyoBIAfCOdAZuvs7v3dd823pYhJ7Sneh1hd
         gl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247653; x=1785852453;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c5fc7ww9/HSIAlazJaxeZxfMvt8Px9TwkVtADywhlKI=;
        b=q8tHPibR/cpoqik4OGrcRCtKic8Et5w/BB8lho3B7/j2tWAN3/kCVdm9kzyG5mhdWz
         Ru4/t7h8npGUPwJswWm16VH8PPDJJdT+lZBztQ3B5+Q/679+jNodfB0zMA0l+lrsfmFU
         kjMZ+pH9tHfT8oHeeWnY1zLJoVLflWBd8XoI1gMNkW63CVXV/Qy1JYiGqQmrSzb6r6jR
         i2KsegzNUmQiFIjE4YUKdZYk9eLbbUgoz9cdoLYuPdapPtF15DbR+p2LEpf8ODSw92fC
         ZRPYSnUlugVTxE5mMXnwZIyTXb+972ZweM4WQ5z2rmNhRF4vD4QwwHKw4gfBI5MZYjbN
         8L8w==
X-Forwarded-Encrypted: i=1; AHgh+RqFewkRJfxbPX9770G3J7r1B0mP6bgd7YInFPOlGofLXPRKoZGbQsaY6elq7yExZ1+WNYtQhxEFpQgqCnYeEby9@lists.infradead.org
X-Gm-Message-State: AOJu0YwSwSVt/Fkpe2+T2BBh8YWw9rQ6DsJLlSLvp88jii0hlZjw3ywK
	Bv6hOx/TDebHwTh+876Z3ZU6EvzEW9gY9bfX6GvwQiT9KbUOx/7uhJ7A7thzOl502wu5MjgbBcG
	q8auPsniXxrypTgucMFI0ye+upJPOeuTIlpjkwoGHeqgv0yA1pRx3R+91RS6cz1KSnB+yXHqVma
	d85H90B+0C7w==
X-Gm-Gg: AR+sD10ZFwJk9EF9IKvwvAUa43f/XhGTsZrdemhkBV6IuErDoNdFSwhCZxFqRjF1Kap
	XDsjSjR+Ciss8V4XjjswLh8vAl4EIDdNjO7vHl2mkhiin4AQMUmS2VglwA/pbScLF+CxE8j7Q0b
	aE4M9p/HV/X7tWfXvnTUTeu8SEN0/V5eN3kH5QBwWJ/gePVVntgAJdOAchMLQJ4iGTFPG2/nIK3
	yLKzvgy10S+oykByG7SiwqnTDbAfu1Y+WDcB7/Mme475yDG++4SdPw6feF2eFKRCKGJHzX6c+14
	X5bhzqpj+smoya8aX7kit9/4+xt8gX9BQIMm3Euns/S/y5ON38tfBEWKFaPMOQ4GEfOqMG+ThR6
	zfwsKkoMpc85QxxunNQ+7g+IyJlMLJQ==
X-Received: by 2002:a05:6122:1690:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c33f87ed39mr1032840e0c.2.1785247653269;
        Tue, 28 Jul 2026 07:07:33 -0700 (PDT)
X-Received: by 2002:a05:6122:1690:b0:5bf:b500:c4f4 with SMTP id 71dfb90a1353d-5c33f87ed39mr1032759e0c.2.1785247652689;
        Tue, 28 Jul 2026 07:07:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d2e3:b407:476e:c977])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c44a9451sm91612285e9.1.2026.07.28.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:07:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] ACPI: arm64: use platform_device_set_fwnode()
Date: Tue, 28 Jul 2026 16:07:15 +0200
Message-Id: <20260728-acpi-arm64-pdev-set-fwnode-v1-0-b5aff9b2235a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJS3aGoC/x3MSwqAIBAA0KvErBvQoR9dJVqIjjWLTDQqiO6et
 Hyb90DmJJxhrB5IfEqWPRTougK7mrAwiisGUtSpngY0NgqatHUNRscnZj7QX2F3jNq1ylNjWqs
 JShATe7n/fJrf9wN6ipR6bAAAAA==
X-Change-ID: 20260728-acpi-arm64-pdev-set-fwnode-1d50f24a5c12
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: brgl@kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=X9iWrt01a0N1nePUzdckSKX+wCmzxqLgNdh/jIQjCXY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqaLecgpRoz1EVR/xySHZvL4LJ8+fldkg2iAUqX
 g/9ZYu95TqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCami3nAAKCRAFnS7L/zaE
 wweXEACiogBZUO0KpBOSfIVdcyTPkEdhiBpe49Zv7WSZD8fXBpUd2iQe2gmYKXNBg5WLgmeY8lz
 hPf49ne0+GnnWfQX9efdQipHEGxL+RHRsilxP2eKijGNWDOs/55mm3F1PHzC626krpgbc/cw/7D
 daEiOJX1RKDBQu1P4BYNkhN5OwPgryUTJo65GY66RTSMENj/tBPEZeZRUpLubEEComzsc+BFJ7m
 dknDTi5kdBsB99ujnsiLXHTBGDUeMmeGQvmswGrl4AnEeYpHawsIbkckVwtOu90ucw00bNbyxoL
 zkw5KPH5RGjxVDOK9ibZEVm1gUIlWVYft8ejf+LxEC1lJu+eA8tdPEFKtVY9YsRFdmQy1L5sbog
 3UhYfJSCYhPHdYmewR1x5JeN26g3DK25JcQeJK0/Bgy24jNZmQgKiPFx/n/82G0U4xaDwY5ASTq
 HvZ+V5jbZghkXhGMg3EBgQ/ZmCaiK1Ik1+B0fdhva90uavQZgiVbUPdA8Mj49SLIykrfIfUs45j
 MZoaEVlUCIMaS8c8VT7YizUI+unlgGeYd4Z67thOw7xtI7Wt67HcCy91KBs+wP5X5ViPRk+syxW
 ZDRYo16U90LTnX/H03lVUmiM2KfJb2zwpJhEinSoVHLE2E9Et9A1t0tsup4zEULduLCf9pFnqmx
 c8gD0HVkcR+BWfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a68b7a5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=js6g1tapueaBODJy6MUA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfXwpEJJqSOt15C
 qbJusTtlYWRceGuabkHSfPakEhblanCRdIjKgUTgESpP4eG5A+kEFNxu6MJ8Eo94DMWsxtayveH
 MXfFKfP71Pij8kVnUmZ/2ndon2FbZhjjQwLGWapscHgFBd6BCcsGDyJFGiAQRa4nKKzJB585R8u
 xg6gBW+SahZP0Ln007q+H9GYO4Kjkz/61xZho+PEemPwHWWmMOj2v/TspTm/zOFQuAUB3FNkE2W
 qG4Nzv0ciUUnl3rTT8VGxRRaDblJd52wuHtp7iCq5A/pF+mYbeOKe6yGiXTMPNt2/2OyVxG9pSr
 WuwUqflTeWHDhIHwVcKkuMsjYtu35eyPzaqxMhOPYYXodMxGVztFmKKpLpBV1YkF7VPz/cKT6hK
 2nf78axz93/TifcQtHmHGJHmMzEFZZVExeaqkQJQztV/0PHgWCs1Htbly5oI4W5Z9YZhrw3AK6E
 RdF5oJrIPr8vlqXbKyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX3wTW/FZWk2SA
 x1ELy2avGHbu617XgzI5/T+O62AbmRVSEp9Q9cei0E2NMfvSOYdo3HVMnoBt81NMdZZAt1g/m1M
 PjXQS5Wtu4GgRejqQKuGejjNMtPV9Io=
X-Proofpoint-GUID: O4pE63hVoSzwAgNYory4kC2zqvqL-rRE
X-Proofpoint-ORIG-GUID: O4pE63hVoSzwAgNYory4kC2zqvqL-rRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_070735_598340_7CDD2287 
X-CRM114-Status: GOOD (  13.21  )
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

Note: This must go through the driver core tree where the prerequisite
commit 8877c06885ce ("driver core: platform: provide
platform_device_set_fwnode()") lives before the upcoming merge window!

A series of recent changes in platform device code provided the
platform_device_set_fwnode() helper but later changes converted all its
users to different APIs. The function however should be used whenever a
dynamically allocated platform device gets a firmware node assigned so
use it in two such cases in ACPI arm64 drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      ACPI/APMT: use platform_device_set_fwnode()
      ACPI/IORT: use platform_device_set_fwnode()

 drivers/acpi/arm64/apmt.c | 2 +-
 drivers/acpi/arm64/iort.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-acpi-arm64-pdev-set-fwnode-1d50f24a5c12

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


