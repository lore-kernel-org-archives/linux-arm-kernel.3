Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8170AC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 06:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=njsXx1MQHjG0pYvx/jMfwxyJj9N+8fHFUPSJkTCfXcA=; b=lBqMugY3pp41dREpCHXSmhyTlM
	o5yOzRVrzADelfu6RW6PDdERRrreahqeNJe94hLH/QAALXT31pql/eyMvB1BIV4WOqWqSZFXGw2S4
	Az+nIN0QfFulTSmiTWdHC0PDsk063ioWEVyzgdwxFZPCpXeGiRg2OOHJMQcj2TdKrmE3baDEPrYql
	/g5PUm3f6pKA9bcdreZkRIh5JdxBY6679CRqxWRGXCgsuRtT0o4W/+55tNFuNf8G8bSDcz53m7gFj
	DdzUsfHpy7sveZ1kEBlZHInXwRd6uZULzkq27Cuy6i2//qoveE1ZWSCohkWWHs+xks9alzqjg28/8
	29wBtt5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZGd-00000004Dvd-1XrF;
	Tue, 15 Jul 2025 06:35:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZCd-00000004DM7-1FHr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 06:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752561104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=njsXx1MQHjG0pYvx/jMfwxyJj9N+8fHFUPSJkTCfXcA=;
	b=jQyqORKH8hzAnMsW1p1EfT9nITZ63oeRP3vC1+j7JgV8ahkXPVFA62Zcus2qdPEtPmniTp
	Q6VE5kBfr17moJqbFFURq8l+RBp2T8cLVuhCS9Yb7Fo9Qu70gcPk7zuRZKHaBy0GZqDxRe
	MD2J3rzQjWpFR46M55W3LkfCj0o/NMs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-R4TXG7cJOx-QIwE6ma7_tw-1; Tue, 15 Jul 2025 02:31:43 -0400
X-MC-Unique: R4TXG7cJOx-QIwE6ma7_tw-1
X-Mimecast-MFC-AGG-ID: R4TXG7cJOx-QIwE6ma7_tw_1752561102
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb66d17be4so383441866b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 23:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752561102; x=1753165902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njsXx1MQHjG0pYvx/jMfwxyJj9N+8fHFUPSJkTCfXcA=;
        b=t9BztfGERYDGzEViaT8F3ttbv7yVqkJUha0myi5YhzJotSGyKA3auYdhAi+G7o/DWR
         xkmwr9xIVd8XlrW5TfnTC4kjXPEhTWG7W+ftapzTze7oLse4HkWBOf52u5gyPJnDAiBe
         qopDY5nuRknDRmIPBVzSPMPsZFuY1zavi8d2kqPtuNvZtbt1wKhTkLv75pPDbczLstEn
         Rq0r2PcoqJn0LJTdmUuhAOk68AJasZeIuOogFoA4HQIn87B5jXnEW8BOZ+59HfiuWFfY
         KqFQ2+bBSho0O7RtdAuWt9OiFqWqrVX/GB0V2DLY5tH+MgROm3SrLK8fjb29y5q4Qf/l
         YF+w==
X-Forwarded-Encrypted: i=1; AJvYcCUDsRAyWbqjFK+nqijRBqyOEw8K90o95cdJPYytS79kvmiq0QaZcaWR3i44faCZUJ+cQbHU+okZ+1/OAVt4MvY+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/qACnOjvsElJpsqkxMlgtGV99THtn0hbqDsoC8riuBlpCTJ7d
	CGM1Djz/AC8uInDYhC37TzuvYyIBZDsRXkhm00IZpOk3j0Ni+irEcBr4TjVrtMXvgdeHngfRXih
	u6uhMSEUKPjOt9hqw+SYFXgqAum9t0E0fjk7mdVY1FQYN+rh6R/uYFJFocEzrlITGkQZOWNtaAV
	Ft
X-Gm-Gg: ASbGncsqs1rg5N/XbjAinI5I5ZRD/HaqWHKzOqdINtKixwpzWyptbj8kATk1WgRJZWL
	FnXl2hHXbgnz6NWUi0GpBsOVGH/fUFzUGbw2I1L12E9THVLBNGnLGyb8fhOLUAt7ghSeZIIi+VA
	r+HA8uoYjZtsrVhahx/hAxAin3hT95xGPuTdCSuPrD11Xd0tVfdAkLdHrybCgA7eRrYYYWyeq3/
	EHKoSfT0UL25Uz0gtiTS9NAuJ5AvUMeYSFGXNstf/4atrHtidDdDUaJMsYQSOC4YOR9eVbvT+J/
	wUGGPjBx6AswExhVFJp2CAl9D5EIs0W4dW6klvuSxTl10hQRAZQxaOJy58ZA1/z0K1Q22M0D4JQ
	AmRR6lb9cZg==
X-Received: by 2002:a17:907:3e14:b0:ae9:876a:4f14 with SMTP id a640c23a62f3a-ae9b96bb26cmr146895166b.59.1752561101848;
        Mon, 14 Jul 2025 23:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbahyJQ8uPvvKj2Eu2Bjb83oyH09cB9oPzy2+yyYmKgrlH0TrWtXbUYxonD5LHJNMzFi0wSw==
X-Received: by 2002:a17:907:3e14:b0:ae9:876a:4f14 with SMTP id a640c23a62f3a-ae9b96bb26cmr146892566b.59.1752561101291;
        Mon, 14 Jul 2025 23:31:41 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df56esm945349166b.156.2025.07.14.23.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 23:31:40 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: merge sections for ROCKCHIP VIDEO DECODER DRIVER
Date: Tue, 15 Jul 2025 08:31:34 +0200
Message-ID: <20250715063134.100733-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rM9-tsJ04qIjmq9phol54kSdSCPqAcAj2mNKUmmAZYA_1752561102
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_233147_426465_9F2AF7DE 
X-CRM114-Status: GOOD (  14.70  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit d968e50b5c26 ("media: rkvdec: Unstage the driver") moves the driver
from staging/media/ to media/platform/rockchip/ and adds a new section
ROCKCHIP RKVDEC VIDEO DECODER DRIVER in MAINTAINERS. It seems that it was
overlooked that the section ROCKCHIP VIDEO DECODER DRIVER in MAINTAINERS
already existed, referring to the same files before the driver was moved
as the new section refers to after the driver was moved.

So, merge the information from the two sections for ROCKCHIP (RKVDEC) VIDEO
DECODER DRIVER into one. This essentially results in adding the maintainer
of the previously existing section in the new section and then removing
that previously existing section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5efcdb5537f5..d044e4f71ae5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21673,6 +21673,7 @@ F:	drivers/media/platform/rockchip/rga/
 
 ROCKCHIP RKVDEC VIDEO DECODER DRIVER
 M:	Detlev Casanova <detlev.casanova@collabora.com>
+M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 L:	linux-media@vger.kernel.org
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
@@ -21693,14 +21694,6 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
-ROCKCHIP VIDEO DECODER DRIVER
-M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-L:	linux-media@vger.kernel.org
-L:	linux-rockchip@lists.infradead.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/media/rockchip,vdec.yaml
-F:	drivers/staging/media/rkvdec/
-
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.50.0


