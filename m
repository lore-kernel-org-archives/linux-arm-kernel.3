Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0814D49209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3VAHDTdSdnUcjMrmzQom8uUSDOBZ2weSAUyUK6y+NhY=; b=VgQtyiaq6XPgHd
	G5bU4nAddptE167xfiBWeFvphiS7iAb6JKistW2p9PdMYQw/J3pkA8gTPtDONOWb4vRekYiVkFoEv
	sei/76xy2i9fHFY8vaNcFZpjIBlKPHDMvBNaItRPChtpu1TQQA9RtoLqzmU0Yzr1Zzz/kgEtjlpgN
	uoz2OXOqk0LIS4+uLx+moC4WPsh5ZgDnctAurhqHNanSbjeJeiAo9+w1eclumYd9D+ajqnyXKZt1y
	x6Yq5nUbvDD3R0f/ZszejYObhy6Bj16ev3oKjDYIDeK0JtwelwJmEaOGdjCAl5E9zS0I/SjNYQaGI
	pObvg/THX80w8tSKiHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz6V-000000096YT-2Ual;
	Mon, 18 Nov 2024 10:35:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz5Z-000000096Ko-2mpq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 10:34:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so33057975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 02:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731926075; x=1732530875; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VAHDTdSdnUcjMrmzQom8uUSDOBZ2weSAUyUK6y+NhY=;
        b=RG+kSB9dspY5vWlRq20NkO+bzTYwtxuJ+uFlTCYqhKelHnWIphEJE3CyvxvZjxafWl
         LSl+7hRzWgccoYlb0pCStbOyz1fRHU3sDs3ZC+FwYMPAuSdHTvC1HVn7kSPlO/gRL5TE
         h36JTUGISsXDW1cLeidKyp1Bym9zLDjGiyjwcRep6Fei9v7SFz4AypBcLcMHKKE+b+LX
         66l+xbglrZbM6E5gsui/KbuwJTIhoS/ahR9rZAitLzCcwGJY2GhI42KDHzOvaE82j/EK
         i6rc/5XzJIZZuI3Bi6j6+dIvFXFTUs7xJc+gOSMHGQt8oNaBuUxMNA0D5d+rUM6b7L4P
         L4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731926075; x=1732530875;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VAHDTdSdnUcjMrmzQom8uUSDOBZ2weSAUyUK6y+NhY=;
        b=aKpGBsIw5+bDVYIGpZUzIGS6M3C5GdzXawm/TzAYIOBv6qQN1uvZrdCPjK8kWTpNA3
         9LWnAurtO6V8sMCanX2Dz1Dpqk2GkjLm0UX+pWc5Y6ICU4Qr+PC+tiqUBwDX0mVnvrXZ
         S8SOJaYhTshbay9oaw6IqJ8oYatya7wZWGGMeXhyk8arZ8u7np5WOEsp8WQtVo3C4H7m
         0TInjotiGRj6lsdlUn8WwXIvchLDLjUl/icwO6jilaoLQS97Mmmu/5cjGr5LB2QRQRxD
         h/JFeuE5SAGh5T+8EmlMAwp90+e/TkbFyllWJi6AjR0iD5EJ33y+Y6yK8qeHgcXOkc9Z
         tN8A==
X-Forwarded-Encrypted: i=1; AJvYcCUO8jIqrH/W3rJlP/nTg8Cj8/eAe3GppooaHql0XV66nxGsiR/dykRDCJ7lvGceP4dWHieOVCOCqiF8R95tPTk/@lists.infradead.org
X-Gm-Message-State: AOJu0YzR9ixhBzgUi4DIGk/Y4cqqdQ7C43KYtlF9QI/Rd4a0hRRvlIDJ
	srT8EcTBVNl0Oj83d877nDXHL7LDv019cokasS1aSdvYIwLj4QT1k98ErgRkkU8=
X-Google-Smtp-Source: AGHT+IFxjSgWOZeMwBydjHIA/ty6oUxOJKnYUIUmBh0PHN55/0Q67i27jFciZxiAhLtnxqrGR+4o4w==
X-Received: by 2002:a05:600c:35d1:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-432df72c1cfmr100625065e9.13.1731926075377;
        Mon, 18 Nov 2024 02:34:35 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:5b7a:75b3:1e72:6e3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38245e95925sm3162979f8f.111.2024.11.18.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:34:35 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: x1e80100-crd: Add USB multiport
 fingerprint reader
Date: Mon, 18 Nov 2024 11:34:28 +0100
Message-Id: <20241118-x1e80100-crd-fp-v1-0-ec6b553a2e53@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQYO2cC/x3MTQqAIBBA4avIrBtwpB/rKtFCdKrZWChEIN49a
 fkt3iuQOQlnWFSBxI9kuWIDdQr86eLBKKEZjDY9EQ34EltNWqNPAfcbrTXWezdPYRyhVXfiXd7
 /uG61fg4ipKFhAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_023437_708343_DEA55503 
X-CRM114-Status: UNSURE (   9.34  )
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

The X1E80100 CRD has a Goodix fingerprint reader connected to the USB
multiport controller. Set it up in the device tree and enable the needed
driver for the NXP PTN3222 eUSB2 to USB2 redriver in the arm64 defconfig.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (2):
      arm64: dts: qcom: x1e80100-crd: Add USB multiport fingerprint reader
      arm64: defconfig: enable NXP PTN3222 eUSB2 to USB2 redriver driver

 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 48 +++++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig              |  1 +
 2 files changed, 49 insertions(+)
---
base-commit: 30eb6f0b08b13fd25ea12a3a6fa0a85915190c1c
change-id: 20241115-x1e80100-crd-fp-8828cca97d66

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


