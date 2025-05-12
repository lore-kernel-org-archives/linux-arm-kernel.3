Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E642C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLb+JRGLVFS0BSqKTkNSyQIkAQdMTPXYGYGh/OuIIrg=; b=QJfI6ArK9vzhKEI+iM5yItTm8s
	sLVIJGLq667V3KNlpq8q9wn4zspd5oLTjmVvI1MVsq50iPmDJTy37+KSRVzh0iDE5rEOnGC9auox7
	Cf43GR/zv14Gfru0sGL3AUCxSe5Ou6cifp73VuGtSAh/+7Ev5bp+53FgPdlGvq9JrpC2WUfGnBC1I
	+swbwbA/nMVgGqe0iy5WYiK5SbtMUnR3VguHXcltIDCKKDOCGvb928N/Nr4n6ddliqvr7FB/RdEa3
	29fOFWX1wA1vdp3J5QWvkrDFydj6nT93KiZSTeLQG74gaP0PxOpQUhdsRE+UbQmZQb+vVEQr+YR16
	m7N+MF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVBY-00000009t3D-08OZ;
	Mon, 12 May 2025 15:35:20 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETl4-00000009f16-1M9T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 14:03:56 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2c873231e7bso3502759fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 07:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747058633; x=1747663433; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dLb+JRGLVFS0BSqKTkNSyQIkAQdMTPXYGYGh/OuIIrg=;
        b=BaH0JYMEQcmi/3EN0IaSwn13EhkB0Pgw+5jCTNhDFRncma9DOJJLJ0mPcAD3ogPTN7
         1Vd95/i8u2w3nGYQYN6u5cO0O6HupAd8LTGUSkNBGLiimEjZ2Rwgb7yXw/4gmUWaztOH
         aKS0yT3PDpU12yY6wdH14k438FLxZcBP8zHJi/Xmq+0SLaDI9AmJKdkEZy4hVqBj/lbF
         qOcYfmXTJAFTjouxblCMxeuh4gZkKdkTfJSA1bfFDBxv96iHQ4OHqBIOZO0rjluDxJYN
         XldkbzCKYy/aFNBVMs1QsgwvJIzg9uxDfjfP7O7Lv2nhJozwNG+ehEEcdz+Fb+WQZJx+
         4yTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058633; x=1747663433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLb+JRGLVFS0BSqKTkNSyQIkAQdMTPXYGYGh/OuIIrg=;
        b=B4hK3TpDrVtXzUwtINPzsBNxudyb1nfkWUAx0YTGvkDnuz2hiOJq861/KhmsqUDUhK
         ReDi/Xu33VmHijebatMjFBS1IPsZN4wzpq7/yJQLbnYsikpX2DfdAiZyAxMNIoZaZfRR
         OeKWPdHxu/tDz+LeS2SIMkTS6vO/7xhWFP27PqayA+cCZXsBgtCiOeNE7FPaM7zApkXy
         jX5r30WvTbJ2lwYjfsKKwdiOWfdv3SAfXSimJrc7fr9aUnHNVNjFkwh5uF2XK37n+vmh
         eCyXhvwQZNsHPafnFH88MggSkf2Cbw8M8K/Up2UVHycGFA4fOrwx9G9cZGdO0JXXzp0b
         bbCg==
X-Forwarded-Encrypted: i=1; AJvYcCVfGYNwlBhrI3RwlWk7NMfolD0RtXqMhTgoeWB2B8R6xSeUy0HjXdUiODOyOxOLXPUfd5SEFIOWnZYjExLJrg/l@lists.infradead.org
X-Gm-Message-State: AOJu0YwkTyUQESfwbfO4muJ20+oP4imQZuNSTIVedkuXf0SRJKECBXXx
	SN0d/iTOPwfnTYoze8+xdYaYYsnlkT+TBuRRx3FDgxEti1KwDFxw
X-Gm-Gg: ASbGncsULu5s8gD2JzyjICGtH+qcLUOxRrAAx4xDdwhjTwT5h38EhOch3a8IgE4OzNM
	iWAqKgo5Ijj5SGMwjV0aLWxkcvm7+XQCRITDNjJHJuGM6NTQtcAw/Kqgr2rf+Y2rmZ5q1il2QuD
	yKlvpuyrEjQA1ybWEoQg0Sm9oEmKpAuD5P6ap+K5kynO9819VFi/81WMofsBtznMgynzikigiHb
	upDB6UuPvUpP5KCaApWD/YUIfLHcNnzSxTmdT6/fK9pSYV2le3/Bbm/CIfooJa+D7m3iKjIThH2
	V5y/848lsSXgdnojj2vfwz3mzlG0Bb59qzSQQMkKgqdLiIynsH0yWg0Ty3t8XRC8TeIyqN0=
X-Google-Smtp-Source: AGHT+IF1tkZYqYyXXtjmaPTB+Gkqq74Inf49XWAK+PjfZ2RlQ2OoYywpaAUFYYJ6wzuQTsDoXjEWhA==
X-Received: by 2002:a05:6870:5246:b0:2c8:34df:8c4f with SMTP id 586e51a60fabf-2dba453cc52mr7464382fac.37.1747058628114;
        Mon, 12 May 2025 07:03:48 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732264d59e1sm1553171a34.34.2025.05.12.07.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:03:46 -0700 (PDT)
Date: Mon, 12 May 2025 07:03:43 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Xing <kernelxing@tencent.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] docs: networking: timestamping: improve stacked PHC
 sentence
Message-ID: <aCH_v3fSZXROUHpD@hoboy.vegasvil.org>
References: <20250512131751.320283-1-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512131751.320283-1-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_070354_367104_A5D23840 
X-CRM114-Status: GOOD (  11.82  )
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

On Mon, May 12, 2025 at 04:17:51PM +0300, Vladimir Oltean wrote:
> The first paragraph makes no grammatical sense. I suppose a portion of
> the intended sentece is missing: "[The challenge with ] stacked PHCs
> (...) is that they uncover bugs".
> 
> Rephrase, and at the same time simplify the structure of the sentence a
> little bit, it is not easy to follow.
> 
> Fixes: 94d9f78f4d64 ("docs: networking: timestamping: add section for stacked PHC devices")
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Richard Cochran <richardcochran@gmail.com>

