Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17E4C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 21:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usAr8RVI0THAJ8XIFOJ4ZxGvrwrm2FlwhEayG2wImz0=; b=BuUQ1dR2fhffxMG0atVuk6X3uH
	nmDjLkfgnxHqXOCFFfkexaA4f931TwfX5dyQHtEaUi78zbGAzzNQESo0xGYRyDyLvksRllBQJ4akN
	MftccLXK4g/guDrGE5sglSOL8vlMv8CSf66jpy3Xyq3Mveur7Ztcb9GrETpl4EiD6bgD7IZTKNWbT
	bJ4A68nO0bfFr64wHqGLISMzO2LYTPTCKGeXpUA1Du0wZe9dszo/c/ZQ1fkwbOATUqeF3Z5dUQqHR
	/9Rx5oxxfL+2z2L7wIttpyOMh6GBCgScAkb9VvxB4FcGYy4mrweRbzwt0nc0+3ieiEppIaPSytMgV
	/nlonsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvcT-00000007xuR-3qyz;
	Mon, 20 Jul 2026 21:33:49 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlvcR-00000007xu0-1DRv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 21:33:48 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-81ef8255cccso31833247b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583226; x=1785188026; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=usAr8RVI0THAJ8XIFOJ4ZxGvrwrm2FlwhEayG2wImz0=;
        b=eW3S5LLI5hHt2T3El4QA0Wqo74iJxcEXO/ajAodaU+79IthtYlC5sz8v4/AP9T0VlT
         Z8DRYPqWlBjtt1yE+LpsuOhWJ5DtaPJAIBy+EEGVRH1zh4JSQRFaBY5PVi16Z2Glla/p
         bGh80SvTgtUuJHyNhdFnpeWF0OLKGIkabC9y3mHVPuKGR087ZUqSgEKmaFh7X/zf/aF9
         frn7d51DN/kwPOT1NWZJuhQ0wyWmb+YjLOF8Egqj4eJn1R4kt5NGqj46yFiDQp4xS/iG
         ze8J1ARCKvNThJf92nKpNd6yI7vzSe4ckCoOK64VUVDvd1yDEb2CjC9sJjuoZEMT0wkB
         E8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583226; x=1785188026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usAr8RVI0THAJ8XIFOJ4ZxGvrwrm2FlwhEayG2wImz0=;
        b=gj9oWahhJtADLAAHAY4XK9lZummxeWgR/xClAkh1L/PrQvUGeizXpReaW0v0qJwgxW
         57Mifna8T57wjJpaOY+sNW3KqcBZHcXp+NF2/HJNPdUs48s3FsjW24z/NkKkYd9RCFKj
         JtPBsrJAC4OD1TQh73ZwU1ezhFJMzguzJxOva4QnNCJw581k2fZ3XUlX+d5jNM6oU25w
         rg+A5uRGa2BSIFQQrSxay7mTig3458BvBpVjr1TaCOKkWvTEaC8BJNGCPf+d1FASxGSO
         T6c62zPn+q8HY0ktfNM7AtEBz1uAr1pRKfGobJHEL7RO+iXrZj8r0D2sbXjUw+dwU27U
         pVMw==
X-Forwarded-Encrypted: i=1; AHgh+RpwSaQftYdjyOz3WTxgkjUFinbW7BylgUItLXw+wgR78sXMXusaAsc6ResSd17VqZrN/hjYDUoY6jsZ8xCU6/8E@lists.infradead.org
X-Gm-Message-State: AOJu0YxSc89sL+0OVGVcUFvxgMd2js/m+scCxtCbespTNrBImeVcyNnI
	AhforxCT3wX9aUyDwAXqkVBYGoqtpvWVEpdxnhUCpxqAhhONTySXLqdU
X-Gm-Gg: AR+sD13gI6zbRvHRUkgeMsmORgL+68Xl14hJ4X8vDkgPr2tXFb0dREyqYWCStj9aBqz
	XNJ1a4VlWCSVsuWvXCNgC3mpYNGbDWPmx3UjwW9483WVnjhZOzDvTb6fZm1LDN4qq0s2Wt2rf/4
	E/m3Jvp40Gkhm9JVt+f+Q8s+nXdzCViHQQLMwttR/xcRl+lo4d04OKWEVa7IXlGHc1x04s6s55y
	RD1ZFfG5CSalsoTzWC6HXu6kxZoVGcwOTnd+Gb7AiZ9wnyklZJRmpFBa1rcq9JEaid6VWyI7VF3
	gTxZNYqxe7pwmW4G7QEMubB7sRhbpYnka4iueMVRW4FzPjJ53GUolrCJlRCPZS+SWZ53gxY8Lzd
	OJDbd3QHcCyLlD5UhPWD6S1OfU/uwxVIuA0STg8+K9z1QVg/sqzowr8eqrCRzfe5xF+//NdAvzi
	9aOjJuQzZCZEYqFoRx/HNcFGT5kr7XgzpOfjUyG9r3ca6dq4w=
X-Received: by 2002:a05:690c:6607:b0:81e:d032:f3c8 with SMTP id 00721157ae682-81ef26a5baemr53618927b3.37.1784583225589;
        Mon, 20 Jul 2026 14:33:45 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:50af:ea84:8387:c8b5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef406700csm56746327b3.22.2026.07.20.14.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:33:45 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:33:44 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR
 receiver
Message-ID: <al6TyVD2EO3MxHY1@zenbox>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260720225310.039aca2e@ryzen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720225310.039aca2e@ryzen.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_143347_336951_0B538224 
X-CRM114-Status: GOOD (  20.46  )
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

On Mon, Jul 20, 2026 at 10:53:10PM +0200, Andre Przywara wrote:
> On Thu,  2 Jul 2026 17:47:46 -0400
> Justin Suess <utilityemal77@gmail.com> wrote:
> 
> Hey Justin,
> 
> > This series adds support for the CIR receiver found in the Allwinner
> > A523/T527/H728 family (sun55i). The only board in this family that I
> 
> will you be able to send a v2 with the fixes we discussed in this
> thread? No driver changes, just the binding for the new specific
> compatible string, and the DT changes.
> I tested this on the X96QPro+, and also managed to enable IR operation
> on the Avaota board, where it uses the other IP instance (and another
> pin).
> 
> Please let us know if you can send a new version this week still, to
> possibly allow a v7.3 merge. Happy to review that quickly then.
> If not, please drop me a note, I can then take care of that.
>
Gotcha should be no problem! Sorry I was working on some other patches
for a bit and was out of town and didn't have access to the hardware.

I'll get the board out of my closet and do some testing before I send...

Justin
> Cheers,
> Andre
> 

