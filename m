Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD644CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 03:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVsjU9yKl2cJB/WfxCzz06jvF+n5PC9ZLu0AFLXamVs=; b=ha6UEBqwxyjLTvJXlXEUnGn+kM
	CjDpb4yPrISmUwDsh6UFtBNJZKz4JexNkeVvc3aE1zFpP9IH4wuxT7e9Wo7mxPlmBmBtROdO1SOYe
	xtduGrHewlClHY2XEjTUC0hvnplBnq9lf8+e4flFJCqnUS66/HzK31GxIj/MXFRjOsYdTOgAwXHWE
	64RrLwCnXuUmL2DSFBPBkKjtT3bT9KzVc5jFXDR+7MWYI0D8ALEN8wzZ12nP96dxfewxE+1hPW5ma
	iU7fY2OE6youIowgqhsefWqM+g7IRErnUxErtFXerxUuMeDPcI9jxxSUEXutPV5MUU2OOM2fknQUV
	cMoRh6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwmT-0000000ALLy-3ep7;
	Fri, 26 Jun 2026 02:59:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwmQ-0000000ALLJ-2yIy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 02:59:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c7f5869cddso3365755ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 19:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782442738; x=1783047538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVsjU9yKl2cJB/WfxCzz06jvF+n5PC9ZLu0AFLXamVs=;
        b=nbMXVhJH8hUUF0UasdolN1bwzugsd1NRc6Px1kStmrh3Toy2lV0R4wUoe9zHOz3RGI
         PoPvx75t0tmK8ueMWqawMeKOn/MZMXHnTYWbaZLTzYT9bSxZqxg289GnTVkvM7y4RAv9
         sJiQFfhV2nGZbyINeoK0HxsQcAnm4LZZtY6F9/JJRhX3OVMlwQ54BduGFSMk3HaH59Hr
         hgfsB47jh5SSdNun149HQVW97yVpqv6YSFIq+BWI/CRGZ+X5813w9Wo331roR8S05ddm
         8jGfGdNJ+uiP2RyZEYhFzratRt3R+pvP4ifdcj4hq+c8dgCEKUUxYvirbo6lFZZMFQeY
         eu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782442738; x=1783047538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vVsjU9yKl2cJB/WfxCzz06jvF+n5PC9ZLu0AFLXamVs=;
        b=Wh6EgsrPD3tVQkHzge/OFvfGRWVG84ir1Xw1ecqtLcQwmxCx67uZNMCC4zuH0B/9Jr
         Ga63YH37v145F1uaOC3cla6DyCJqa/FQxqzqgtMARaHgn4rk/vPfzD+nBWfBuJjWJrpf
         ba51FlrXaW5XS1xATvnjU4DL2l6oYfZGyOG0qA2Po4v0GSyrAqy10RVvhNfFxJvQfdwS
         HMYAn4gVt2Rsmx1BUl1BryMwU4CV1tJrDflg/hgsaM7DHT6FS8mRMWjGvPCECHL+YeDO
         UGynWsVf5jWpHycc2X84VlcfawIxZlAdOmmyh+SlfvM87I0ForYvYp28/VTee9CedFfZ
         L/FA==
X-Forwarded-Encrypted: i=1; AHgh+RqBdqtKVNaFXNZ8VpjzKQ0GwH6Dq19WRRfFAshLotornzNuPb15rap0VARcILZKSD8HEfrbRfOavRPesFFZr725@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqjv6FXjexFyUMqUqAeKxboIaXkLekhB4LIc4PVch8Pk49b0Fi
	5895kX9kI1mXwjcUQQ2XDExL71sgOmPj0Ufg1Sb2tQwzD9DgWu9RZBdG
X-Gm-Gg: AfdE7cm+P9xrMtURggvlKgiD6Wn0IZpsZ7/F2u8onjzagPYZWiEaO4jqcLCEuTylZpx
	ry+qdN19MoaQnAdIHUB43GegQWG/lgNLDqTad3EIsmqedlVB2LYuwehvv3sTWWdmzCiyMFlhH7u
	z6PeCYMcgZAf7H8zvR4lQqruYmWRJi6+DEretUs4A1N9UvS3fxMXsDl4fxgRHQFgwiqbrJbuPPi
	vFgxXMKM5zznpLCJGOMIVnFuVXGtPbCotnTn+RdVAbDx+o9H5CLl0PBUOucBZ1lIS5MPsmZF4KY
	POs7maPEX5X1GT1dW+pBUTYVtiHgxA1tgHXXPDC2HKbqbrK5JHWl8yXWiH8PlY9dq1ZbNvjmXRL
	HZYOo3TFbD7eiFVu8i3YgquepsbAtWMEzW+qOc+1FR86/e+de6/VzYSqFhVBSWN/rCEUr8ereXv
	BbR+toki0lFfI=
X-Received: by 2002:a17:903:46c8:b0:2c7:d071:3ef1 with SMTP id d9443c01a7336-2c7fca19129mr53387105ad.19.1782442737717;
        Thu, 25 Jun 2026 19:58:57 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afb1e0sm31252535ad.29.2026.06.25.19.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 19:58:57 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: frank.li@oss.nxp.com
Cc: Frank.Li@nxp.com,
	andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org
Subject: [PATCH v3 0/2] Fix slave mode corner issues
Date: Fri, 26 Jun 2026 10:58:44 +0800
Message-Id: <20260626025846.106157-1-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aj1UR5ddawsdMbZC@SMW015318>
References: <aj1UR5ddawsdMbZC@SMW015318>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_195859_104362_E6DC64D3 
X-CRM114-Status: UNSURE (   8.26  )
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

This series fixes two issues in the i2c-imx slave mode.

Patch 1 clears the slave pointer on registration failure to allow
subsequent re-registration.

Patch 2 cancels the hrtimer before clearing the slave pointer during
unregistration, preventing a potential use-after-free / NULL pointer
dereference.

Changes in v3:
- Split the original patch into two separate patches as suggested by
  Frank Li.
- v2: https://lore.kernel.org/imx/
  20260625160219.55116-1-liem16213@gmail.com/

Liem (2):
  i2c: imx: Clear slave pointer on registration error
  i2c: imx: Cancel hrtimer before clearing slave pointer

 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1


