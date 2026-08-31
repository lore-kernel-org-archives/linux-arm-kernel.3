Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3704BC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwGUMrUw+0wrrc1iXCPReksjG2PETUZEO9vVz2JOI9I=; b=vR6mL2MGcr8Z4JzI2b8PiTqKS/
	8vgHhA1tRnTmvPkZPihALrZfI2u9ANCsQszslfAWguIZ1v4joHBa0z+vP/ELlRYkhuTOgjrvsWkCi
	ceRlg5vo3xbiv9mYI15Uz4yo4k6mQf+ECmADoFi7Bi06zk06DG+ung8ZIzxDgcQjWMRR8/FlClOGU
	P3Oe3r9KbU56NpmQfuDo7RCvQVglqLf8bhimdquF7qOObD1PvTlVRKXuQ5M4CeQCcJQkBFP6yoavU
	36wazc8qpPzWXjAAMwz7+h8LoxOCZoga25k/k/IbAU8/BmsNh+p6fE37pWydrgM8nbVbcOLd15fHv
	1QyWVm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BUd-0000000AfH4-2gkH;
	Mon, 31 Aug 2026 23:32:47 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BUb-0000000AfGA-1lRv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:32:46 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-851d4de33a3so389146b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 16:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219164; x=1788823964; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwGUMrUw+0wrrc1iXCPReksjG2PETUZEO9vVz2JOI9I=;
        b=fx6o+qQBuIpvavodLXwqJqc9PhoM/iBnBh3czts/MJpQAVMPQa4TlCmiwIg3SL6Qwy
         wg4fT1xGbpybtYCF3WU/0dMj593C4WGMM4FF2dNzia7pRHVuZlTjd1y+7BqUyJeR+v7r
         JxXneL6NBAgdi/hLUrKyU/hBjMGBti9aVzT/VdHQpLYN1//DuBDVtnmQ7u+5UR47vmxE
         4gCOGE1Os9b1JDy26MRrSNS8oQTeRaJUUbjAMV7Zh9lzLnDRDZNnKyHVvYi5i6Ci0q5P
         eC1Uo9+pBe4cEjydd0nVVGd7XuMc2+5cm5dW9uRLewtGW9aaePvLZeqPvqRbZ7wiJLP9
         +6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219164; x=1788823964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwGUMrUw+0wrrc1iXCPReksjG2PETUZEO9vVz2JOI9I=;
        b=sk/vPp+x5qLd4y+Pr3PvmnLQ9kWIn3gSlpPgUyqXQpI51Sema0TPq3erA2HUPEP2OA
         oNSwJ8x0zSlqERfk2ug+MjwJHqcO0cJBIwDG0pO9ZMucUnJcm/5aa/kXR4vfdV8h+UUP
         C65FwtMwJ7kvzULA/ihvTadjCot6vBXcpxrXiKdHzoUXfth72ZMOZ+1ft1Bi8k82jpxG
         Bd2FeBE9VIKZ2RvfRvx8mwrdb4eEnR1t33VSjiEU+TK8wOD3VFKZdQWOhygvm4PbAB4u
         ndTp3nU9uQP9WkUAHVwLAvSWWhz6atdBNBg8CsROnf/tfzF2mBudpRntM1Kg0/APb43S
         4vzw==
X-Forwarded-Encrypted: i=1; AHgh+RpleYTJL4Z/Izo9hfbUrNUyDZm9ppSBeYwcrqN+0nt1e9aW0OgfZUmv5opHRR/jKJGKnJRFVXaV3qPwbkdN/UvQ@lists.infradead.org
X-Gm-Message-State: AFuF++kmNuoxJHRQ4hpGMfExcSLWNqrPJKUdQPi7cXsm3L7WNgkdMwl9
	NeWPengnaBCv20/ljNOKsbpKxgA/1YtUxhmdycc9rlPiMdldBAQYvFdL
X-Gm-Gg: AR+sD10wEveMRii56iI06+LwxVyKs7qKU5iJDVzXr8Cv9BO1/9X4iVzjp0+GScXyTvd
	pp4gI/+MMtYnc6HxrBoteq+CXYPQ+HcTlxlTVoo4x1nzaO2/JdcROx/ZYldmgCcohanrkE0p38/
	Ebh2OexIj6lKG3ZtMx7MQ6GusZ7tnnb8IEN2GIoJR3zIs8iGmq3OvZmQYvEPhbcDLLigIWp7XzY
	012x5NjP/UJN8VbLur+lgMu0w9R5b54AA8xPwb7On8dSnWmDx3IaYhYS7eu0mf3EbQsiXJBQ9kk
	XN0hEw2PBOrUkzMMTBWrIGMuFEpf0LTexhcVVel53LyB5K16lt8F4qd9fck0jx7BHEydvtXRT6W
	iCmFtnUd5QF3FK/6odTeTjZ5kYh8n9BhMKBD0KzLsZxcmsiAj/AHA1uho8T6T35UPIkfqo2wdZZ
	S0CyRzxtQp9l6lsPgj42NZm1ZhGlsUudWd5TsiVB4+F4LXrBAxbdLlO1AFhLgT+kHxbKmd0v274
	aLvQqs/UA==
X-Received: by 2002:a05:6a00:7184:b0:848:3dbd:5cb0 with SMTP id d2e1a72fcca58-8562a9d1974mr17519520b3a.2.1788219164559;
        Mon, 31 Aug 2026 16:32:44 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be5ca747csm154393b3a.5.2026.08.31.16.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:32:44 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 05:02:10 +0530
Subject: [PATCH v4 1/2] ARM: dts: ti: keystone-k2l: Rename
 ti,davinci-spi-num-cs to num-cs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-davinci-spi-v4-1-92e9c0b2e1d4@gmail.com>
References: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
In-Reply-To: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219139; l=1130;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=Ov1XS8DApdBbDQSgMBsd28dUz5gN2fFzFBLSEH/vge0=;
 b=RsRpTBLy3yqoifFU8DccNs4yKt7uU56pAIiuHzQJ3ZZRgfW1Q+CUuuf3yBQY9SEWIv+CIaKdA
 Xp+rIiEgzJgBysl95QtZif3vt6VyvLSBpPM09IPN9+JMtYL8uSlnw5W
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163245_472842_D0D3B371 
X-CRM114-Status: GOOD (  13.31  )
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

Property ti,davinci-spi-num-cs is present in the SPI
nodes of keystone-k2l.dtsi, but it has never been documented in the
bindings or matched by driver. Driver relies on standard num-cs
property instead. Use standard property num-cs instad of
davinci-spi-num-cs.

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..39a846d7f8a4 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -401,15 +401,15 @@ mdio: mdio@26200f00 {
 };
 
 &spi0 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
 };
 
 &spi1 {
-       ti,davinci-spi-num-cs = <3>;
+	num-cs = <3>;
 };
 
 &spi2 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
        /* Pin muxed. Enabled and configured by Bootloader */
        status = "disabled";
 };

-- 
2.55.0


