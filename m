Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74F7CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LbLj7fUNzpDp9YMNc8I7rTF77G8YpYO/de63oiZ9pDY=; b=wVhbSq01KxHJm3spHH333N5ldS
	DL+9NTPLQWxh0gVmFGd0o+RAIAid5k9Fpc9anu1xb9EYtqcdS7JtPcbDpXrodfHXuTn6I/nsvXPzx
	qjrStxGJoLJSUInjhtrBe181e+nDz2K7Z0JPfXeOgJG7rhW8lYSUskDEccl2QPqD9VQlg2/sPvhRO
	l16sxrzrY3+3YvKLuoXBKv25mUSheeGU2E/E/HWcvnQ6P0rjNlrxbcNj6mirWQH2cpMEnazMQYjgP
	/JTvkwbNDxnNnoXZe5a/KAF3prXDMF2sGoUtg6F80wxsK6lJ6aCpN9QTrwaRy9mfno9r0xWPOcVTs
	EpQKpsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3rE-00000005blW-2sKl;
	Fri, 09 Oct 2026 06:13:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3rC-00000005blA-40Un
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:13:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so51491025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 23:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791526405; x=1792131205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LbLj7fUNzpDp9YMNc8I7rTF77G8YpYO/de63oiZ9pDY=;
        b=dBKv/YOxkc8eN3/cL7mi7NL2FZJimXG3YKABzqx6M/qUcE5CnTU4YhiVa36hF5WAxY
         m3RpOJifSqRDPGXAgAchg3Pe73Hjch9Ai75Y22q40lWptuLBXQ7QiOVOfCX9NVnddeU2
         oY0zIDcj9Nf/Qp69SkmbnKymmsKft+jdQyu/jKzvbNsf7c030xxWlKpPZa4ndYhbZsK1
         PH3fVMpc2E6kJXrh//99Supp8g83FyiAOivqcS4gqZZ8/cItNMcrFzk8RLrK99IBhmdl
         KaZGXMnFZQ3ztKAjIPtuamS3yQUJ99fsFCoU8zb40IVkZ37pqtsVt2I58blc5tGxJYxo
         qk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526405; x=1792131205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LbLj7fUNzpDp9YMNc8I7rTF77G8YpYO/de63oiZ9pDY=;
        b=WzkxmGTNUMgOhP86GuPmqxyJC5wur7UzbWeJvk1TeDvfJpjilfBi0+7pDK97rjIjih
         FKvvxqgwg80453BJAblFLLxHLsL/U01tgKg8JP4AB1XR09zwqsneKQj736s9DXzm9jB6
         f/+o75zWIjSBm6TXXo5fJqgOX7wlMX4xgslMl1OsgmtEaJVosi7Td6NDv03IeWHDwDvb
         Lcjkdam3ShV0qGZqWYpyRUuAYTokvwiDvEUSQALtGtC+q+2wCWWOjQJ/2+qQW+VMg0TN
         iEG6pqPqxOeIMV0EMLQ/nntyNiBcOnP5QI+WL7RJKFfSQ/Lq0LaFlhKDta6So/kNwYjG
         10Jw==
X-Forwarded-Encrypted: i=1; AKwUvBxv7fQuRi5GS5tCBrlFlI+Q2cdhv8MZdmkwkauiEdjoIHN6awOhBvBspM18u28mSpJBtmNiWL0C1qIyrlelajnr@lists.infradead.org
X-Gm-Message-State: AFuF++nSVJUqeHQ9SdtyGyg+HBGDhZe2VAkpuDiU9lzzWJKyt48DmaTS
	cXWMSCFa3hvgHV5ESoNJxdzVwFJIwE0GiQvQtFN1CtS5i4zjFRmheJAnI/OZwarRziA=
X-Gm-Gg: AYBFou1I/ObYRraNIspJqEHrvA5zT2AOCsBpbBGp+vQUhzkpZj64t3NrMpSAGb5Di8B
	XsbY7D03AopdxTlxubyr3IR+rqQCPwXmJpmTEIt4FQUYF3dUGo8jLOzx6Smze1owiRWEQn61+2g
	auROxHepYtGHPH1usTGFsVGZ6BM9pjbiV/7ajhZt9YI4kmZtsAj8QVkvZMV5l8lBiWfrbIPjnBX
	79X6UqPxtJeKqnuI1E0FJXI+PanpMvp5/M0SD67oy9wO6oAxMctXmMQoWHFkt+/fzvxe+wypEoQ
	oDKHp7REy68soHQQ3jqqVeOh9HbihWATTp+0E+AHJxgiCiaH2GVW8y2Ebgy9oHxd0iSkEGM1wSb
	CgZl4eWaatYwTTOBVfyVkdm1oiIhi/ocqonX1d2biSqqTe/0tMIqEsmQgCGAZ9q3LPjhP4LQ0Cy
	BhobALD12zfivS3+1hK2YC/DJUwqSafiK1JHO/Yl06I0b2JdPPO9o1lus7lqH9wwPEEoCBqMsxi
	Kx0M8sZv0lceieOVyTpVGcycs+auJl7hcX7WXbIceTCWND5no8yyw==
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr14028205e9.21.1791526405319;
        Thu, 08 Oct 2026 23:13:25 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([82.208.30.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm33923145e9.13.2026.10.08.23.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:13:24 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	conor@kernel.org
Subject: [GIT PULL] Microchip ARM64 device tree updates for v7.4
Date: Fri,  9 Oct 2026 09:13:23 +0300
Message-ID: <20261009061323.29781-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_231327_019630_2D423FEB 
X-CRM114-Status: UNSURE (   6.20  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.4

for you to fetch changes up to 17483ea458ac0093982e8ce9fca3a8a30c4ee6be:

  arm64: dts: microchip: ev23x71a: enable QSPI (2026-09-28 11:03:19 +0300)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v7.4

This update includes:
- enable QSPI for the Microchip EV23X71A board

----------------------------------------------------------------
Robert Marko (1):
      arm64: dts: microchip: ev23x71a: enable QSPI

 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

