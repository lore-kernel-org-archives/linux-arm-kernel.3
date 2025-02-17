Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40888C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gslSeLU065wOuo/exeqAIaqsKgFJISNX/u1ft+G91Cc=; b=Shp0ZoUwQycg1bjstGxJpEdjWq
	n0oa3wgKe7qRfy5XHepdWGpX1Q5Cf/Wvp6UG8uEpnGZkX9CZJu4jMV/yBKZlXkwAKvAPjPidMI9TN
	O4jVSrClilMvv5bNcA7yFTlCRTit8zIbFTvYmHMI1FTYeiGRrZkBQsVCQKcwaM8r34Zyq9GvAGAel
	I2dXw4yyWmH2tQ2VsK5XYJZbXCtdTXCyQR91exaFZHiUYGdwR719Hchobx1G28ANEWHSFL2emVuIh
	M3ZKG5U45UcU7wh4Gjx/4XZJi4r8vfTyekdXagVbR7fDbnSKqS+AjBGlep0Q0zwn6C2JKehDBEHeo
	K0w5kNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0G7-00000004STe-16vQ;
	Mon, 17 Feb 2025 12:29:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzYv-00000004MG2-2uQ9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 11:45:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gslSeLU065wOuo/exeqAIaqsKgFJISNX/u1ft+G91Cc=; b=eQqjishPKvPA7sF/OqynbsJMYT
	ycG2pSBuAv1kY8yZnhCUyohyZxoOzHJEcvHmehUdYmrmnFK/YAoVEXdJ0cWOJfM9YKkmvvja6E3n7
	C2Zh1HEzp4G97RzwaaOytsT/b+YaCw0ASkDSfnX/7ksAaIIAuIJkF/1e2B48P0RUhpl5VBJrgLtYF
	TUCqBjTge/yIqoG5VFvMrTmIJ/VCx2yg0IFKxaUU08fwdP3VGfMdVbl60xkNs5DJ2qdE3j8S8Ed0S
	j3P0iVd7feE5OAdgh4G0OgU+rI1NHiWOyVMbU5YWJUI3H3GPGS0950K21QHqQX390zZbSqfPaVqy9
	x58dJJgA==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzYs-00000001nzb-3r3R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:45:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38f488f3161so292848f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 03:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1739792717; x=1740397517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gslSeLU065wOuo/exeqAIaqsKgFJISNX/u1ft+G91Cc=;
        b=dqVJ6Pm6tP0/pQSUYxb3AUCFhius7wFQv1nK0Vb0LvdNTw0/SGvaKwJpN3bbWPg8Xr
         Z6sAR/ZZo/Qmy32ACZK0k4kEaOxtg5wdhXjthbusKvmQ3FiaypWopVGFaRy+WllxosgG
         Re3rCc9WaWsUimj3dAETMCAfo4dma8OJz9Ydw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739792717; x=1740397517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gslSeLU065wOuo/exeqAIaqsKgFJISNX/u1ft+G91Cc=;
        b=lsIhUdgOtFhuFWWAl6ElU2OHVJnpxS3CNF91zNZGshllvLpiJ9FT4kBWNi4aMu7nHI
         eDx9jIK2WwtaT7SV2extucAZLY/chc+F8lXLyF048Wl1GRFfKf6888g0SPJnvGEACNaI
         7vrjpLg5i3an9QcrUQ5RmJ4A9fWJCpzVzp0bNvtVU54JDsTzcF9h5rzJLwBSoTRDJzXS
         IxEi733TPg/Mwv6wbE8mrTLFwcHE/MFnFCMDF1RqMk5W6ZmfY2igka/Qm4Rklci0DmEl
         65MCtgRRn1Pw5T5IycWTnvg6Bs5VZICComGYqiSTbHy4DE3+H/AZfG2NEsndvLI6t46Y
         viDg==
X-Forwarded-Encrypted: i=1; AJvYcCW+cnoc4jESuX3B7Tiz846cjWkOjs7d6uZi1NvA5VXLrLOs5QkPqMxjWsQhzmhpkFmPod8XRzuOwLpj2NaMojDb@lists.infradead.org
X-Gm-Message-State: AOJu0YwTTRvWZ9AwEeeocLuCiGYVCP3/OTrS4C/2bChXWbreqt0u3voM
	8EygC4/MUeQpPGEvTtkuD0Lkm0NHEBoRDdCW3Sd4vkMWvdXavuarI3sERxL57qM=
X-Gm-Gg: ASbGnctpRRZdMW2DtCSnM8Ue7qzDXOhVnie0prCO4qnF2QIO631lQmN5tlk8cJHTekT
	Z4DjTORFyIId7oibbag5kj7/6FvVR+PZvXkog2WM8kELAjjzD6Q9zmp3oRoILCvfrdVbu3ClyZ1
	VGljcfCAK6E7HJCMgHSQ7QRZAtT0TzcIDulRpKpN5UWWeSt6LNLtlawaDrCOGjIKFOMNzswJLiZ
	CCn5hmGGqFqajc35HiDXLLdRdBIjfCsQK4gCTBaE9QAtQ8vnB+UNvx4Uf8MIGYWzjsTJaffp6x/
	TqWWCKG6uDP6dsPLZZyVOIbJ5hwryt6+JvAWMJbqI8Xus+70vPuYkBFXROuSWOIawDKHnnJ3fbN
	M9IXjvQzMzdc=
X-Google-Smtp-Source: AGHT+IEWoZF68RXu+nKi7MNugaByBfNsuJdBAp6ZRW5eMiRrJibFJTDidK0cVOcEQlNep0we4lB5PQ==
X-Received: by 2002:a5d:47a3:0:b0:38f:37bd:1707 with SMTP id ffacd0b85a97d-38f37bd18f8mr7646742f8f.0.1739792716753;
        Mon, 17 Feb 2025 03:45:16 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:78d7:ec72:38e9:87de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbe0sm12181637f8f.39.2025.02.17.03.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 03:45:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/2] ARM: dts: stm32: add usr3 LED node to stm32f769-disco
Date: Mon, 17 Feb 2025 12:45:09 +0100
Message-ID: <20250217114513.1098844-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217114513.1098844-1-dario.binacchi@amarulasolutions.com>
References: <20250217114513.1098844-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_114519_053301_CCB5AAB5 
X-CRM114-Status: GOOD (  10.57  )
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

As indicated by the board silkscreen, there are three user LEDs.
Add the missing one.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f769-disco.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index d52e36aedcfb..535cfdc4681c 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -86,6 +86,9 @@ led-usr2 {
 		led-usr1 {
 			gpios = <&gpioj 13 GPIO_ACTIVE_HIGH>;
 		};
+		led-usr3 {
+			gpios = <&gpioa 12 GPIO_ACTIVE_HIGH>;
+		};
 	};
 
 	gpio-keys {
-- 
2.43.0


