Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09A1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=; b=2y9TlDyk0D3MKm9J3upRvX1EKL
	X2rJ/9N5ZYNH6KLb2fYg4UY7xLb0r7bZ0ixQDk8gJHDg5YKDJnQchgzwGxWmFo1bgoTI25rykRn2W
	87+OhUYKH/3ZwCkOInPz3soPIsHzhqH9Z88Kwf+FsS55aykhUSnh1Wxpf2dfKlrrrLvbVe/nyHn5n
	1qxD+7xaJU2MLq4F1rQJK+Y0qIEajk5U3AH9sPIGdLrT4ooFWbDxDNcCHf14466mZu/RAuVrf9sRJ
	SofRUeCbeyRqhWeAB8KIraQr+6GcXS87T6sob4p4KWdxdCCKjP25FrXPYlCQUUZHN4h6vAqJQG7LW
	+Ky0Z2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCVY-0000000AJvP-16be;
	Mon, 16 Dec 2024 14:55:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCRQ-0000000AJ7h-3t9N
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Dec 2024 14:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=; b=gamFmcIISZumAvjZGc+tKtQKzi
	W5FwFIciTRM+Nw1xQv/Iz/vrl2rsI19RlAbPHQlDuBZ4dv6XapSOqiEBZ8/e1yONdV6u+CEIVkCZ2
	z3Dx9Tm19YYAyAkyfYTi/UgUw1XnmnsuR6Gp/uZAZMvcb8CiQ3LVPs7XMMJmKOKOKqdLjs49A32AS
	rSqJDw0tcqyf+CU7s6XLNvQ7AD3bOuTz0D9oyKZ1Hqc4KWydvhdHTTSwWYeW861Ud7OYTesyernvS
	OeaRP7W6toWUzjtp/pRoQ9nHhaigB6Kw2KH64fmJS7OneQWqbTQ6tdbEGxCZejiOzSlr/fzaftfw8
	DX/PThZQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNCRO-00000004sFh-0Tmf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 14:51:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43626213fffso24205725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 06:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734360679; x=1734965479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=;
        b=Ta6t++uaEch/WXGOallMk3k659FPRxyqP751s7zrQSlVQGpO8effMj2VdE6akf/gis
         9fMTXvN4qS0ND6D7wIcrEyXP7LxQ7etcHOaXVV9Z2Ii26VpCcEAVplCGdlvd7jYNWJ/i
         TcEOY4BmC7qaSUuErdIwdvPn19IStMWc/EpM/jp+PbwweJSEkWiVWiK2Fs5WkapJBZWI
         5Fehj63MpcwaJPH0+tB0C9/L6UVMOxJSJdDTmpJLZQpyFHr747YXF0J04GrrrdvdEtVh
         RCbqsbaCUsavWjtrriWfjHoIvWOIaCCRvd/AeWrnHPHdB4nMubNFanvSg2R44DXht2tf
         85Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360679; x=1734965479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3O9xjwYbMuKJBMh8JPk0dRAP4OjyngOz+BP2VQZxpdg=;
        b=l+0E4ETKlFfq/O6cN1Xtwo/pVEEvGc6lTmVqiMT71Uf+2hkH3J83nXsTd2GeXi4lBx
         PR62SYE3xBG4TLkTJL7A38HPFIiRb+2GVrNMTTpP6FjE8RenVmHRc5HBOZE53edzdGcA
         ylRoSUjyH5CEItJuKfG3hzkD3hmv37dBdCtHslXrsYfu3tCANXshHYKSlinmE9McX3+y
         UDBMerrVATWivMS+VJGgvcblZ6rmpPp3V3qTe9fHrOyaquSIRc19HXwJa50AYP9QZF9k
         BTcZ1TUM9b5GGbq3J0dcad7K1Zt5XnVoztpaH/dkh6dCc3cckyvbRQbZ9uvpZlzMjMVu
         zmhg==
X-Gm-Message-State: AOJu0Yw0APNk2FlzsPaPZoxTXHZmydiOg7L+SJdUH5exPyvuphkNId1l
	Cny/1jWHnJ1ZdKZ7YMZ/Vxu5RedHJS0p8cBksEYWd8mefCyjWkHp
X-Gm-Gg: ASbGncuH8rH4kULPBqtkrYyp4ZL2zE63NxA5xs2Ei2Kra/H3ek/1LGVmUU3GF1b5VC/
	DoeZ3XGKHo6GAXOghPaMeaxHAqn4CXyhVWVFwjKRGFZqxoBUtzcr3ckcsqzb0oK6Rl6KZOlQs9J
	wvPlf62ORPfbH/y+TTJNPPOn9tr4PdTb/EAnor20s8sPaxPPHT96WBLbO2II+95XAhxDRzTa/pd
	PYv/XUMw/D5g0A5gkmGbdYt1+P33AFavGguph73m89ItjoQ9uuNoBHE4J8gLgKfdfO2C2lvqad9
	9pJ3tz80CJXbcPUZ
X-Google-Smtp-Source: AGHT+IFA3RNClGg885yiYlISYsYOJeTw1Fd1eRv96uL8DaVCl3QiM+cW2wRgxshrWVj5DiQhXeuZ5w==
X-Received: by 2002:a05:600c:1c09:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-436230bfd93mr136287915e9.9.1734360679587;
        Mon, 16 Dec 2024 06:51:19 -0800 (PST)
Received: from playground.localdomain ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ed6csm141616455e9.24.2024.12.16.06.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:51:19 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios support
Date: Mon, 16 Dec 2024 09:50:37 -0500
Message-Id: <20241216145039.3074-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_145122_310466_77E64306 
X-CRM114-Status: UNSURE (   8.87  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Introduce the 'widgets' property, allowing the creation of widgets from
4 template widgets: Microphone, Line, Headphone, and Speaker. Also
introduce the 'hp-det-gpios' property, which allows using headphone
detection using the specified GPIO.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/sound/audio-graph-card2.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
index f943f90d8b15..94588353f852 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
@@ -37,6 +37,10 @@ properties:
   codec2codec:
     type: object
     description: Codec to Codec node
+  hp-det-gpios:
+    $ref: audio-graph.yaml#/properties/hp-det-gpios
+  widgets:
+    $ref: audio-graph.yaml#/properties/widgets
 
 required:
   - compatible
-- 
2.34.1


