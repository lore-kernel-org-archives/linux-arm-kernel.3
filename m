Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2C2E9271B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYrFpC2ukouvpetm9VHioumxJHutUQ8FiBmLFt+Ed7o=; b=IQK32OR0LeYe+HElVpOJsgEcKz
	LTqRJ0BQ8so2lfstqzaRzYqbhR3eepD25ury91226OIfqfVbUqwFQjxvYAQsesSKIjAJc7x/LMhCh
	brTcgQjYWIwUZa8V0j3Ra/qp0LeJIjxikE9hszVosT0l6Rcd0KAUlhHfn4OgDtGsJEnqP8utmo5j6
	6pgskjlFRWIfb168cBxLnFD9UQaRBLlQaoNNYHrZO2+R22cTowVIzo0e4AMGAGcvbdxvL5+9FpDks
	lyuj2j8LydpWChDgnizYIZktXtXYPz3/rlFPOOC/qvhlz31dXcUa1u8KJ9G0j1dqn/5PFcrpCk+/W
	WrhXtA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEx-00000003Xzw-1gqq;
	Mon, 29 Dec 2025 10:12:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaAEq-00000003Xsr-1CXD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 10:12:34 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1006758f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 02:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767003150; x=1767607950; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYrFpC2ukouvpetm9VHioumxJHutUQ8FiBmLFt+Ed7o=;
        b=Nqb/0Nda8ud8pe7ltiSUDpOKEFzavQ4ZUr+NB3nfMmFkv7/SxC/mD+n7aoSbC54wzP
         mL2ku7mxLpm8S99kf8L4q/mf/FKOvAsGQkgnn9DMLV1ifVlPPCCz2yUfkliHkMLnIK0B
         WiMnLHJtUK7Udbqyurpw2XQ4BbN4HtQsCCx35s9mW3zcxEzSXwnYtjhs1GGUV+8lGUCQ
         CHcAKDwRHKeLzVNHsz+WHsHHJ50a2vVnGtGU4AXl5XKzUqNKPU7OYtEgSURZXM0SghJD
         KR4X/yppwpuNJtGRhSJ80Tujdl0a3vEMqHYdPpt7UM36asLnaU8I3tzndEeyv7ozZ03O
         tZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003150; x=1767607950;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LYrFpC2ukouvpetm9VHioumxJHutUQ8FiBmLFt+Ed7o=;
        b=AiG+dczZWerASK8AOnTNnQZQuAcnNJsBwd0aENSqzmWaOtohVqANdVcM28uBnMsZVr
         SHwaGn8DbZOybQ/tYWHU5T9WQ4FOxBzGTUCilgt4r5GMIT6eYo0daoYMFbOtJX/tH8cf
         faodn2GXDpjLXhUfjAY+3LekV4hQ6kg57ZHfn5Qe6IGeXlSPztfNmFWNTW0yu3x+nILU
         tA5jdB3/ASdlYnw6H7Ylu/BmhIzP3bmq2OcpPeG2JhY+HEL/hE8xkmdQYRYke6dYDhzK
         T4XmGi1tLD211SXH/5wCg4rfPV3HSpD/qWOpAwviVl41XoPQH8fzjXZXUPCJNxoNkmhc
         AChg==
X-Forwarded-Encrypted: i=1; AJvYcCWtGerTScfuTA2jbdSkwqkBWGfrpiX6VNyGxSjVfLqru4ni7z2RKHVGVj0Y2B8csrLqpcOZpN42jjTHxWQNXxru@lists.infradead.org
X-Gm-Message-State: AOJu0YwBjK60CviCRDDVsAB8bltVZH99xQ/6EkvwzIwzb1TP5HUv9zMn
	POC1AUAyk48QRk6oT/83WEjH8cOYTRaGDidqQcGZK9j0LXpIfR+fSc/e
X-Gm-Gg: AY/fxX4oylGDgesDx/oRt21cFDG24SwwqauW+Zwa8rkjeqtG5FeU6J+XusFj69zmWpH
	9IH6MRTzj5cYV+4pFBedXDstKw02qvEkIjKy44H9vop/5oCB8i5ooyXxhy9pNHiDjYm6VqYjdeE
	OaeCIqg5j8A5atkk4gK6+neS9IUEKDBAP546fViFB08JCI2XtKW30N1R6bVk7xPlbyn4iN4FXUB
	L4H0rCKDHKH0xtHaLO9Y2pHXhHRCXo0FK+b+efpjfC1RvdIpRVwacmlXR72E0SjPBg1J8QhZMu2
	k4pQ3rbmXPX0XstAUMsTp8pxKfKwCmA7QEmBfJJOaWzy+A8B2f2zPV3fGCRfVlhSZQy03c/kDYH
	0Th5VyrypGFVZK1fat0MkrV/p4/RCe69BHawLeMllzNxch6sYPuoajGDg6IdmvH+Vfauao9cwX3
	rdgzq0Lz0qPlzQTGLfUpt7TftTsUolFPtg3e5Obe4aA6ilXyjh+1e03Z36BGeB
X-Google-Smtp-Source: AGHT+IEK9wJeAIDWOF3Sw54bLCDElC2BlMNbmR+47Ws5pcx9oZ1NKI4nDjnxIV8nnoav+VbJjIoLzg==
X-Received: by 2002:a05:600c:4fc6:b0:477:333a:f71f with SMTP id 5b1f17b1804b1-47d19576cc6mr336403925e9.17.1767003150205;
        Mon, 29 Dec 2025 02:12:30 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-45-246.alshamil.net.ae. [94.59.45.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d583f42dasm19840735e9.6.2025.12.29.02.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:12:29 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 29 Dec 2025 14:12:01 +0400
Subject: [PATCH 4/7] arm64: dts: rockchip: Enable HDMI sound on
 FriendlyElec NanoPi M5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251229-rk3576-sound-v1-4-2f59ef0d19b1@gmail.com>
References: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
In-Reply-To: <20251229-rk3576-sound-v1-0-2f59ef0d19b1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=alchark@gmail.com;
 h=from:subject:message-id; bh=kYAQqntJ0UXrsY5dbZYI5NCwHltAh46+MWIeaf74zUc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQGhTAlrL/HlxIvv+jr7lvJ6773vVpr/2ThZIYjM+9s/
 XJ+6UI2nY6JLAxiXAyWYoosc78tsZ1qxDdrl4fHV5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BQx1jHiIGLUwCm2juN4b/jkmzbDSE/oq9PjZ77zbU6Rqh7/6vawM0xW5/Vbf6oa3yU4X/kcqU
 536sfbnz5+fDF2za/l2ttj20WcsxqOVzRlXe3rIgTAA==
X-Developer-Key: i=alchark@gmail.com; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_021232_357934_7A77C0FA 
X-CRM114-Status: GOOD (  10.68  )
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

All RK3576 boards get their HDMI sound from SAI6, which is internally
connected to the HDMI codec. Enable this for FriendlyElec NanoPi M5.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index f350e96de1f0..41d352994892 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -326,6 +326,10 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&hdmi_sound {
+	status = "okay";
+};
+
 &hdptxphy {
 	status = "okay";
 };
@@ -852,6 +856,10 @@ &sai2 {
 	status = "okay";
 };
 
+&sai6 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcca_1v8_s0>;
 	status = "okay";

-- 
2.51.2


