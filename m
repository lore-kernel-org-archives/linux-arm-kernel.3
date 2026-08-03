Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33303C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=; b=Ca8KxE4Lr2LS0x9EbKlMS6j9c4
	TUYjrYGEyehwDfy9BUJxpf65cUdKvPVQrIcYUTs4Ixk8Xe40UkEK13PkoAgSvrhC/ZbYJHAsPdbeP
	NuxRevOiphBmUm39DPLJ9L90oiTL04Jnxh0HktRb52BW5sGYQ0CvlYmo2i1pEG4SE9G0SKbHEymgf
	HwH+e/7xxtrrIFhevzdx357IH8ADm+UwMIgWLkcLz1g2WqTTQaYg5I0+0KQiiJBXfIaeEKEnnKiCy
	Ux/09b9KacMurpa5pRORkfdfD/Y180K2+9qCpnE1YdXOdwSMhY6iy+WOiu83LW1qIglrv0YhraAmT
	Ba7h8Lhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsQj-0000000H8IH-45Za;
	Mon, 03 Aug 2026 13:10:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsQh-0000000H8Hi-2Urm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785762606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=;
	b=ZO11/LNo5quwi6u+VzYVrt+80b5mAXn2sGxXqY1xE8u42ngJ2tLWeALhk1yoR6EDrx0n3x
	+G4Deco+t427y+qLcHiLATTHY8zLbn23sL8uePx+uy0fYfRNUoo35zP18KZ13FOvCgfB0z
	gs53dUlK5lGadrvWShCw4g4pjpTXBkg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-t0Qr7rUKO_WuD9REPA9HdA-1; Mon, 03 Aug 2026 09:09:55 -0400
X-MC-Unique: t0Qr7rUKO_WuD9REPA9HdA-1
X-Mimecast-MFC-AGG-ID: t0Qr7rUKO_WuD9REPA9HdA_1785762595
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e67e87752so31290237b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 06:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762595; x=1786367395;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GUW6H6oVqnVvcG/Ou7I3vxmPgZY6GyVYmapcyiskgI=;
        b=W4zcXdHJCxPxn1G1MM2jbJRE9VbPPbnTDKGD9B6J9IQGBZ+TzrqJ2Gwmi7Kw6ovi2b
         38vomv8pbFEMjd83+IhhXJY7/bFfgeYnAWYKqljsA4/4l5HMUmHAVtjb1sN3s3srxObW
         YVuxZkYWvv9HNuCqhvrrUHa4noKDOMJXQqUe8sZEhHZSAxN0F8oKW4xQD29sI1VJnenJ
         p5p/iQIfBibrkONqAeHp9BMaFnGgOLiPOFUXonbTc7nCJ6I0gPsxK7vxVXmcmIYyw3pa
         2hMPi4jKU/LAB3ms2kax/7kN3yP34yX62Z4T1CRu2ZkFfN44EAN7jXyL1h88Jp9wGIuv
         /0JA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+21WfgbIznVI6WIfSdnRw7oTOydOG9ogUg/dksw+qiojtCHkxMFTRlZcFKK9X91FFUwcRsCJrc/dP1F+EvbSG@lists.infradead.org
X-Gm-Message-State: AOJu0YzQnsLGgyv5EP6MB/5PwBLI5lCvBsx03E9l00RgkW4k8Ovmo9Ea
	s6jkHbKgdDE2uGrzZW67xJaRE8urnWi1VU82xZpm56u9wEv7iX2vW7zuk8WA7HI9la7i33lYAud
	nWSPJxYhyAOS3InQqXVYngF562aNcHRuNaccjzk9FaTTCR0vwLHFOYgcWfnRpLi+WCp1fxk5XmS
	A+
X-Gm-Gg: AR+sD10wHa1qYgfeVRXydJR4aAqHYo5ZH7ZfIxfBCnst3faXnmf2xodOe/nd59sUpQo
	ZE8RTcPzt7ZS3e6dFe5tmDdD5rmMzNrii5C6VkKZ5kovdqrs/Wq9Mmiolo1qFLuV8gAWh/RmeK0
	7ZtMaCU1BdQLS/KrCNU03eySrcSLArQ+oMLDOwrbqV/KXvQZaucWGQ8zUBBXQ7+yDmnMEFCiw/x
	zHUwpDa/Lzh2uNA3tos8ghRWDoFKwE/XQafAxRKZe4P0WkfdePzsK421FeBKC4nwdvCqbeHamGo
	lJAa7Ey/MAEGHVAEwKdQniKNn+751cOTvfY7hoRzPdYPmye3xUdgY8jzUFVFbnvdG16NPxrULtb
	deCeyyY3Q7QA/PlvLkfnP1RBwT0VmW2qRMNY=
X-Received: by 2002:a05:690c:c503:b0:81d:a1e5:a4d7 with SMTP id 00721157ae682-81fd49d3db8mr127611337b3.5.1785762594699;
        Mon, 03 Aug 2026 06:09:54 -0700 (PDT)
X-Received: by 2002:a05:690c:c503:b0:81d:a1e5:a4d7 with SMTP id 00721157ae682-81fd49d3db8mr127610687b3.5.1785762594054;
        Mon, 03 Aug 2026 06:09:54 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm55024337b3.5.2026.08.03.06.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:09:53 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:09:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: clock: Correct white-space style
Message-ID: <anCTHhVjoymK6AiW@redhat.com>
References: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lpLe3xMlEaE4A9pI9qj_WcvpNL8Wi-uSNyQ295YSrBk_1785762595
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_061007_701925_35E817F9 
X-CRM114-Status: GOOD (  10.34  )
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

On Sat, Aug 01, 2026 at 09:55:41PM +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


