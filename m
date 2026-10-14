Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DFBCC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qtI+1ruZBNaLTkzRZwiEy3kiz2UbhsH+GjByvYkReM=; b=45GZpJ+495V/QPT95Xqy9qxlqD
	oUFT/hLdCe5NnNW30RkPEv5B+/107/rdRbu4fD736HaCMZOzd+GgNiK4WX8v+nKOExd3oSk6eo9LT
	iwGlPKAmEkLqiHnfII2ChmorLgqx6ttlm1Jxt/UM5SCyYq144uR+tQY5osC31XYMRw3yA1GHWdLHL
	Xm2vxdf1GTBMsumytkJ8wD/kWINXw9K2q4SC65xRkyRgWAYDrmiuXyccBCz6A9p1nzGspZzvXAzoi
	7IVHDanZaHR9Tm41M7pJEqBD/p4wn7cWoDsg2kZMCw9r66Ad+Z9dEsFgnS2oFYlvUd4sefWZQAz2X
	r9FFCR3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGt6A-0000000EgjB-0nLZ;
	Wed, 14 Oct 2026 07:08:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGt65-0000000Eghx-0SDL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:08:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso26712155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791961699; x=1792566499; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0qtI+1ruZBNaLTkzRZwiEy3kiz2UbhsH+GjByvYkReM=;
        b=d8pyF03/L9oeOB6kYgbz7h9vDqtndnfAyiEYpcqfpuXkwglBRNpsxDVFuCtJ9Qthym
         ltN/R8z9JoAiUtRErJrDn7fxywPsQ9vOAAVBUKCBLoI9viUJyYJ5eZljLefBEphQC44Z
         g44YqqXqB0RcevoMpLft6nGCWTPUY0RBFYugbpYh2mXcBa3rE2ctNsVVxQejwWORpc4Z
         U77MuyoNKyXbofxqyb2kOruMx1LArQ4ht+c7kZxNB3m7zwdDetI7MpSDZUxIU31xrZg1
         ua+G5ds0VJQUGGxE2YAIpjUjxWiDl9NPojw0iEAQsJH8xAAUrMEFGZpht3LdIHem8+dD
         iNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961699; x=1792566499;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0qtI+1ruZBNaLTkzRZwiEy3kiz2UbhsH+GjByvYkReM=;
        b=hhBRh7TRsLW+OXXv/6nNVQBj/UXr1HMB+iEXV7RBRBv46pzTOKre6UncMh0qZFo+UY
         DJNTgCBdy/LPhIRxS/W5njfrIrB97+J7kBwhgDLeJuGBGGreeAwEE98l/l48gvisqjRf
         rwZsKzVTCvoqQO5F86EcwtWNy8vW0mFtuzcJfjmtxi/Pt5bqzPPkWY/B5A9kS1sbqsdO
         nLuCmznMNRAlBgRLsRFVNCgq51e2zwRYjSYU1YTK6kmdfp2GxkYAaaWalzjo3CMXxP8I
         2/Rd1squn9Y8T4A04K4N64dTe00aNdaaNoan7irTsEFeReOHbPWtdrBxdkmUzMdag9la
         eesA==
X-Forwarded-Encrypted: i=1; AKwUvBzk+uC4a4oMEGVmymG6nNU/HIGQ5jwzaKWgobljlukPgsjgcKy5aVdGTPY39Q9DG+2RWSD0VH0fA1o3dA9CwtA5@lists.infradead.org
X-Gm-Message-State: AFq9FYIsB5gOw+ZFq+E6fB04zneXOQYnZq8alp1+QHHuZDuAqmPjLDYd
	im8ZwsLxE95Qd93/c8fz7cJjXnnyU7numvfNnceOR0NTGja2k1cc7HOP
X-Gm-Gg: AYBFou0p6MEbH+RGR8ZKcVHCNjewOrwjXCR7sGC44o5p1Uo1NU6DWEwCBZSYTF2g6fh
	z8o7NzQ0120ef0D52o6S6cyLH9RYB3HgD88sALFl0QghoDNkRv224Uao2FSUneSKordrWTOgGmd
	f6udiNTRBzob/yIjL7QIYgJbwu3eBcuj/iLdrN3u7Yz2P6wQEbtQjwK4ZbmRyQuX91zT15IDYw0
	YiIGHI6KG8gHx9McsT14Wei/o3iKANCREn2jZVH/KKQT7Y6JewF4kWu6RwR0TxmxDUknOBXi72s
	DfUUKiVkP0wEvCYkudz/uwT2moOI6mbDte2RBSYWn7nPoyZoAmf2BME6iZ8p2LJDdtLjP4PC0jx
	y8GOlg5RWcxFG3K1Ln1y4N13lf+dfsEQuYPXoTF/w0eTEWvfzgM3+0XODDF+qVPMdEXVjw/FLq+
	Y4coZv3mS3NbnjN6bUYAB3IajwU5Gdgv3MhqOhfgY1Pf20wDERnecN9n6QWwznHMqcZetQEkBWO
	++Fu1nncQcWCnarnwVW9951moy2wxpnF4xWNL/wVSIX4Ox1bkY4wfFBkaklp23jkziYMg0njKSf
	KYvkvpxyogKbXbgQsHzZBBNHNHnvjHocMDCJvxSIATDt5OFFtnHj8f48KVELUw==
X-Received: by 2002:a05:600c:3ba2:b0:4a1:acab:234c with SMTP id 5b1f17b1804b1-4a1acab23acmr109596385e9.10.1791961699061;
        Wed, 14 Oct 2026 00:08:19 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm32291785e9.3.2026.10.14.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:08:18 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 01/24] dt-bindings: cache: l2c2x0: Describe ZTE device-read serialization
Date: Wed, 14 Oct 2026 08:08:17 +0100
Message-ID: <20261014070817.1718976-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012-eggplant-nyala-of-mathematics-5005e8@quoll>
References: <20261010130024.177503-2-ghahramani.navid@gmail.com> <20261012-eggplant-nyala-of-mathematics-5005e8@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_000821_163750_B06E06BC 
X-CRM114-Status: UNSURE (   7.95  )
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

Hi Krzysztof,

Thank you for the feedback and guidance.

Dropping this from DT patchwork makes complete sense for the RFC.

Based on discussions with Arnd Bergmann and Stefan Dösinger, I have
decided to decouple the contentious silicon bus/cache workaround
(patches 01, 02, and 03) completely from the mainline platform series.

For v2, I am dropping the RFC tag and submitting a clean 24-patch series
covering the core SoC platform, split CRM clock bindings/drivers,
logical reset bindings, GPIO, Generic PCIe PHY, PCIe host, MDIO,
Ethernet switch, SPI-MEM, and board DTS.

I will ensure all patches in v2 are properly routed per subsystem and
directly CC the respective subsystem maintainers as determined by
scripts/get_maintainer.pl. All DT bindings have also been verified
against dtschema and dt-doc-validate with zero warnings.

Best regards,
Navid

