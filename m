Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A09C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 21:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rj/mRgeCj8M3kWXn8y1lXKamZftjeOSlfCZmQd+Kztk=; b=kmkf5PYOcPXxxN8wXdFNItlLJi
	xzkRitgz7DZO0NUa6UicyR+RyMNinCO0QxN7FLbBEtZOn6ENqpoVcK/hLTfC2BCwxg4zVh2PBkxFh
	9FeZv+x+FZD44/GVoRxZxYlAYmksBslwwUjtMe1u+A3D57BMbDcrGqM5GXhc92VAO/nhSYNFN/2pY
	tkZBcEIMXA8Q8XgzIq0fKMT5nsuSqNMrROS59UBkZLUWiDBPTEST4sZBSbJgL3plPV7MEOUSZczOY
	FR4cvL+LVtvYGdj7wrWliD4ZXXx9ffd2YbtPdTymhJGEDpqd3c+im8udaiFbwRNqpRf8WDmEZ4ibH
	xuxco4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnkI-0000000AYlC-0hWl;
	Wed, 19 Aug 2026 21:22:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnkE-0000000AYjt-4AuR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 21:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rj/mRgeCj8M3kWXn8y1lXKamZftjeOSlfCZmQd+Kztk=;
	b=FvuNhPZTAZ2PK28rYi8GxEQfyEKF0XI1qEUvdUQXbGT4vGPnWyxOxCJTq3st7qU6ez8wBL
	Hnln3RsYuhExec2GI9L8GVKKpx/JWuZrcHYgDyjH0HTTNnq5FIUM9RTti6SkZZ798JqbnQ
	m1QZhgcU/W9olbrWcXVkV4pZhLgHlug=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-0pf-ISPKM6-Tr5kbYe0o6w-1; Wed, 19 Aug 2026 17:22:45 -0400
X-MC-Unique: 0pf-ISPKM6-Tr5kbYe0o6w-1
X-Mimecast-MFC-AGG-ID: 0pf-ISPKM6-Tr5kbYe0o6w_1787174564
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90a60102d6eso16759206d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 14:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174564; x=1787779364;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rj/mRgeCj8M3kWXn8y1lXKamZftjeOSlfCZmQd+Kztk=;
        b=pbhq2p4jkFLwaNGgMeRWLrHlc484ehSeEcRa0TTIKM1qOMv2BlPHTWrm1Qg+zY6m5R
         vSkU6PsgmFEntgIsiXrQTYCkt3ih2a1yTl7PJHcxEFZic8jxXmNwStcnjQM8Qk1ERYTe
         mV1BFQnYu9ml3epxsK9fxP2l0sYRhCzyDSXcU3dsYU1JP+V9Ubg9plmasHYIOEOfcd4U
         kdFzWmD6Vbr06EyLH47YiNHHCXy6CIKmVc7O22BGt9DLkBeOLIuRaZyusi7paZuziGGo
         9ki+iiyoXabOSbd79fODh76R9KpdfaYdU5c9hxt6VdfmaWW+J8owU27pHsSHA7FYpbNa
         gEzw==
X-Forwarded-Encrypted: i=1; AHgh+RqXHEp1nTlaDjoC4WS/0UqDkYNG/v08zo8ubLLSXuNJ3m4gqqLGF7oBmgIlSpTN9c/OeqHN0LMuftp9Vw27l6yr@lists.infradead.org
X-Gm-Message-State: AFuF++kJ2kfze300C4Swsjk65mADCzvt8N5LZ2ofE1umGNcQUaV3Y1BK
	Xxoax7Xpy6QxdadCHu4rL5xtExw6ThBiBMJB6hPb9qz4ZRXw3sdNTjUy+WL7KniZJw97WbBz4xD
	GI5AnUksKqOndCzdy+pKLmsWJxSDBGRDKWFKUiXOeexbpIs0QPX6Vn60kVjrHLiWf6peSgctsU2
	bJ
X-Gm-Gg: AR+sD13/L/ddiMlVsa9/7fMeems9eurZK5JsbdgN2CI0r5ZwF1PqagtpVolQY30JnzS
	gl0+9Y/ik2x8Pa+LQ3yfIldEYkRN6MdmgRUlcZ9//vI4zHg0dUgCpV4EECP1SKj+V1Rr/gGxDS5
	Xb4hvyGb0kbkVP5WvjGM7LOnk9Qm5YYuF77HTY3+M8Xng4+hAoO7IhD8+Ge88bOzuRk1sT08GFE
	vmZw0q4jrh6JELUjR46vrfbR2W/YYIJZnLejLnlA9pg4tpDslLgzFiv4I3ePlXY7nRqADOP5rPV
	xujWHkXYAF69xke5nSCfFM0/DkwjhjwVveVlViqUUxkcaKizQxODH4AOZyvfP9dXh70Z1dWpVyf
	DR64ZSnIERBWjEkDI2VHD9HDxgN5vEyhHQQc=
X-Received: by 2002:ad4:5dcd:0:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-90c5eaabae3mr79736536d6.23.1787174564253;
        Wed, 19 Aug 2026 14:22:44 -0700 (PDT)
X-Received: by 2002:ad4:5dcd:0:b0:8c4:edb4:a44a with SMTP id 6a1803df08f44-90c5eaabae3mr79735276d6.23.1787174563736;
        Wed, 19 Aug 2026 14:22:43 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5eee16e0sm23636866d6.17.2026.08.19.14.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:22:43 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:22:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 4/5] iio: frequency: adf4377: Make sure
 clk_init_data is fully initialized
Message-ID: <aoYeoSnvf5-l69lE@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <302584628c4c0699239a0218376fe1c11cdc8944.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZJN0MezcpsvAZuBlkYXNghkJHIMAFew1pHtc1-AW-NE_1787174564
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142247_107932_1BC4B7FE 
X-CRM114-Status: GOOD (  15.31  )
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

On Wed, Aug 19, 2026 at 09:05:18PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> adf4377_clk_register() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: 60e5448ddbec2dc2 ("iio: frequency: adf4377: add clk provider support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


