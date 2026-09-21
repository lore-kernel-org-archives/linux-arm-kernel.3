Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58068C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAV83GG8Wx3vs0tpxEdTxwn0XZCNc0tZOHUrR9Lz48M=; b=WzsprzmQRgsFR0gs9Jqp5SJJxq
	zufZU5uEqZPcTcZ5m2kq8iC5q/JdKLRM20TZxp/Fo0DM19qAYebg225fyFJuiXqOpcbMJgZSr1Sz+
	QJOMUZSGyLDqQ7+01vUCh5BrxCa9CxjbVQ6HbORkjaVRrAROrkruSqLCr+Ll5wbYKgya4O+BQsJDz
	YVfICLLW0l1NEKwqZlp4C13lNoCUgiRYghVScsazT1Y+bBvypZ7vPbBXKDS2cdgva/S6xOg++iV1Z
	Nqus0mbkQ+2vVYSnOW/gF2kdbFopEWywluJcsjUB7td3CVOjlTUAQ0JPbndWiegS586LEia23h9Te
	C7MPe+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLK-00000002iEM-2cg0;
	Mon, 21 Sep 2026 15:54:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gLA-00000002hz0-3JzA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 15:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kAV83GG8Wx3vs0tpxEdTxwn0XZCNc0tZOHUrR9Lz48M=; b=GzmexpaAqT769LxYOZty7UIGka
	2yMfEg8iHik2NwIEZdj2YXS6AC5ASY/+EcUjavCowDFqELVMjo9s1Y7iW9HwizUvGsZFh4IFsbTfu
	4iVB6aV7a83dfoZI64cMAFhlFJHEk4kSZKd/F4GO0nqSobiqgDdn6V015/PsnKmq0GuFYpk1Ukj0a
	00ZPD/juR0A7cNj2+0siBKxd6OMO1ZrNc9sDs6Yxfyf48xl20JPjfi9vh0qAU4b/rMV/oyQ6DRSlo
	10S1ALuEm5qZvkBxSWLxeYcY0uPSwUo9xAMpDJCt4xrmL74O7ROICynBBNhdTNnUx7HfuolgaTK4B
	fMmCZG6A==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8gL5-0000000CVVq-3ad1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:53:59 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d9004a1ac0so20459955ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790006032; x=1790610832; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAV83GG8Wx3vs0tpxEdTxwn0XZCNc0tZOHUrR9Lz48M=;
        b=nnqBb5kFLXedyxlToTR96V94fHbCpFQ/WeE9BLT94bdy/s9j5p9kgxjJGB93QciQag
         J7I1AI2YoBL++CCkmB1BjlcQI0fESQF44D0jGUx66pdsTcWwV/d9fYEhG27hLqW1lOfT
         TwTUaL8suFvdLoIqaKzSbZLbWxMsgW0Q9LXtDvGKGllir6XUB1HUEugP20MH1j7Vqyf/
         nRjTT0/6EKtMJ6xy6wtaZqjkiiX3bSzvVEo//yE7OJP8zSjOSObxkzR+pT4f7Lj6NIDY
         NdkDCUHl9JckrgSHDBUYWQJlx3uqCfA8lVcoflHO6mcOn/Q/2GtHCabx7RLXSK+WZJeO
         sp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006032; x=1790610832;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kAV83GG8Wx3vs0tpxEdTxwn0XZCNc0tZOHUrR9Lz48M=;
        b=dXaZHXh/RMju4BfQNzQiTjNEPt48hqICpfLEWh0Od1cXnWQgOk2LGkPMwitPlJ9uoL
         xjWXhj3g3dHuPuk1bHcS7vzFObEphh4FkvCNdIZWIutfGi0O1A3G/ER30Opq5Jge6ruw
         KT20MsUoEXhcWkttzoMJrDn5sOGxQJQi1xTEbwqU8R5zCN1KDcw/9lVWiy4vStcmXYiz
         aUmh5pcD+3sXniAbLMt6q3JD+1WGUoWNl2HXEsEt0dml2xxANVZEwCIbIr5VMsM84VQR
         LfxtlCEgAupBboRkj8ZmXn9UBC7fklrUR2DxmJYmhy38CsK5C1peQKrs9Uqnwyt0ilfc
         2Ksg==
X-Forwarded-Encrypted: i=1; AKwUvBzVS0SmzNFzFYhYWkYW3YnqAZpg/nUxFlVUxlqc43cKVa/efgSWWLN2t2LuTO9ANJI4gHnTh8iMCGD4ZvX0pX3T@lists.infradead.org
X-Gm-Message-State: AFuF++kiT6A6ukpBxs4lRnk+Ujug71K0N3Swci2uzIB5Tgy5O8VffSu/
	0qR/IIKOybXEXi9gQekwE0CBXipKScM8AM4uy3/Ik/Hja6c4QRjmEh/b+hPxL+sIh5Y=
X-Gm-Gg: AYBFou1aVIZ9xqd0JFWBTQm3yfdfyNDp9q5o/efLHeqPGDLWxTiXRslgs+9KU0Ay3oq
	H+8Zto8awEJ06m/n3SsrIjRkosDU5TR//QzIaLgw3qnuSg5WX1SjYFv/FsFvrEUL39xep/SC+PW
	PvjzALJKr6Ndwor3dNOZWo57W4siW1aR2ITAxYtZKE4c2iw7ANQlQiBROz/64ERnGNebYnWh+v1
	iD4Va/QGmgW/fyZGdG/bov0sbgrmtAjJz7u229KYLSCNEdTDgGVqEnn59pGcgSXU48e8vpZ3WRS
	GCQ8DIsOkTr1TWnyXnSUmqn0r+6VbQY2H2ym7Aqgrw65KY6Os+tktDZwWTU0mwxskwsXMOXLAJ7
	EB9oVzuWir9O3K7LiiAegtPNreRYLLZuw3/F+TkXJZZ/KDUaG0NG6DFszqFJDZ83kA+WA2IymdL
	JEVb30p3rFUmg1bxYDzEfVuhks2FaeEEM9PaCZsIiUAUAoTAzY0ml7IIRPxZLHazxbgJA=
X-Received: by 2002:a17:903:98f:b0:2dd:c053:e0f4 with SMTP id d9443c01a7336-2ddc053e132mr114905975ad.35.1790006031634;
        Mon, 21 Sep 2026 08:53:51 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ddc178701csm36425795ad.13.2026.09.21.08.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:53:50 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Andrew Davis <afd@ti.com>, Tony Lindgren <tony@atomide.com>, Vignesh R
 <vigneshr@ti.com>, Andreas
 Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Davis
 <afd@ti.com>
Subject: Re: [PATCH v2 1/8] i2c: omap: Drop bit shift for I2C register
 addresses
In-Reply-To: <20260908154223.116074-2-afd@ti.com>
References: <20260908154223.116074-1-afd@ti.com>
 <20260908154223.116074-2-afd@ti.com>
Date: Mon, 21 Sep 2026 08:53:50 -0700
Message-ID: <7hzexad2i9.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_165357_530369_711DACC4 
X-CRM114-Status: GOOD (  10.03  )
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

Andrew Davis <afd@ti.com> writes:

> The OMAP7xx devices used a register address shift of 1, but this device
> has long since been removed from the kernel. So now no remaining board
> device uses a shift other than 2, and no DT supported platform ever did.
> We can drop this flag and use the pre-shifted register addresses. This
> simplifies the register access.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

Acked-by: Kevin Hilman <khilman@baylibre.com>

Feel free to take this with the rest of the drivers/i2c/ patches.

Kevin

