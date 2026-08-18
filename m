Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5073DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s7RalJYalhKRrVNBaQlM89E87+WKo3l/uYGYbpKf1t4=; b=YUKdVObNTHzRj20LKeEvsaVEvI
	I0/L0jvnZUeIcoJuDIkRk3FYmJVb+zJUI+/r4CgxabqAEEpBrqYorSMmnH9IjV44fzyGoxP1CU6bL
	Zi1s7Dn7PVHro6GrAMwiyt3jkR/i/ZOrWoSIBrFzfg55e4MdSXosv7Dhbh2FWTxq1jfEPaoZ5f7yF
	Bs8m5/j7Jva0Jqh/iHbiQfHmkkdQ2Fcm/fqJlAZvCgRGfkCXMiZAn2ZMxS5Iunq2HEdfofAVzVgsG
	jZnFSfnSzSlwkMAoeBFexzZ0Xt6ZX4g+AY9fxcqutRNAvsHsnrb6z+NEOm4630nqeK6NnX2SBgiq4
	yPVDdAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLPC-00000008E4G-0qPZ;
	Tue, 18 Aug 2026 15:07:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLPB-00000008E3K-0d6x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DFDC600AD;
	Tue, 18 Aug 2026 15:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F167BC19425;
	Tue, 18 Aug 2026 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787065628;
	bh=WvhBurIy8A9u46LETLcI/MhJB6dhjgHJNOfnkpO39yM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ua7GKg/n78G+6x5wGqpZWztUUBV/90+g6Hn+TSh/UyxK66rCPQbRMiY/AFqVVyxm4
	 fsDRuc+TBTz5sFux0axgOWdoNqwdT4zGM2WgyPEERm/WNZzFNbhg2qq2EOHyrE6y6N
	 ykwnTFZk70+XwTSrSAUwFh4XsOZI0F6S/DN2lMytCkIeeIMShJXRfDiTPb+cFX1QC2
	 D2MEpKcAD89Jl+/7b6ViF8P2aoyrNwZXofno1ytxSeELQc0U4pkM0iqZLxh6ZdRQzg
	 7KnhZPw+9cfueCLg9U1hLX5LS2psCMjo4DSHDat5roRyuQUdmvxTIdoj1OHlhTjyy6
	 nytrus6OZPx/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32F4C5DF7E;
	Tue, 18 Aug 2026 15:07:07 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH v2 0/2] chipid: samsung: exynos-chipid: Add Exynos5515
 ChipID
Date: Tue, 18 Aug 2026 16:05:41 +0100
Message-Id: <20260818-for-next-lucky7-chipid-v2-0-28ae49f5c349@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMV0hGoC/3WNyw6CMBBFf4V07ZDSyMsV/2FY2GEKo0JJCwRC+
 HcB49LlSe49ZxWeHJMXt2AVjib2bLsd1CUQ2Dy6moCrnYWSKpFZFIOxDjqaB3iP+FpSwIZ7roA
 Q6ZonmCU6F/u5d2R4PsX38st+1E/C4bAdi4b9YN1ylqfo2P0i6b/IFIEE0iqXWSpjlFXRUqvJh
 cab0LpalNu2fQAyn4+L0wAAAA==
X-Change-ID: 20260815-for-next-lucky7-chipid-ecce496c86b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=WvhBurIy8A9u46LETLcI/MhJB6dhjgHJNOfnkpO39yM=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqhHUYUQuzBprixPTgcy8Al2eiWPDlLC/auEuGJ
 b7rFNdrS7mJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoR1GAAKCRBJJwGyxHrX
 68O5D/9JadzwC6VB9ScxAL+6S15RFJRmpF8VOn9qdwnh1WYZ/VKTrD9Muug4e+F9O/nVw36zojo
 6vo5AtQFlGMkvcJgMVQIPmjvdgq0YvbSkAwwDrmdJjW8U6GgGo04uFo/HbXBgCfqR+0F3srM3b8
 vlDvy9MKBTNkapfZqRINJj9oMp1fxL4Oi3YiFNC4s5Vv/Bjlek56JSmnreByfg+I3vZ2Sqw3L4k
 ioG6UdUdqxO1oAOiXZ++aLIsNdLot68PYvGwK8eYmvn5okRrqlJ7V/lalAqt9CuqgHgebX8+iwq
 yhWAjBsYFGklIxSZzNdY+83NKI7adh1eNTHLVXSSL6K3zfxzxCWAKb5IQM9PNcPEDwlFautb2p9
 EGJ4RY3tkQlR4lq89e0XzsXdKVqR/FYFR+Juy7wYc8iIr6EM3s2z78DS/3++RNkzRSSKYpTSbwX
 fKIS92m6rJrkvaKeUfQy4U2GyHpMzlFLJUlgBahOdlIULWtw71lgx2FZXdh60NV5Qil0Tx7aDP9
 dACgSMQ1ua0uVicja8Nn8t0S+2cqh8uB25btvPiKL7vaIhgiBHziDmnr6XiRSUqNJxTFlg0m92n
 8OonV5m3McfqvKK17kuRw18g0r3IVV52n0BY22TYPW6hZU/G3abqiC3J++y4pkSU1Ne9kJ6GjXI
 8qviN7VZfUqd1hQ==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi there,

This patchset adds support for the Exynos5515 SoC's ChipID to the
ChipID driver, and documents the samsung,exynos5515-chipid compatible.

Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
---
Changes in v2:
- Correct capitalisation of "Exynos5515" in commit messages
- Reword documentation commit message
- Link to v1: https://patch.msgid.link/20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org

---
Aiden Isik (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Exynos5515 compatible
      soc: samsung: exynos-chipid: Add Exynos5515 SoC support

 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 drivers/soc/samsung/exynos-chipid.c                                 | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: acde40ba506aae78633e080b5704d33cf4bc13c6
change-id: 20260815-for-next-lucky7-chipid-ecce496c86b9

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>



