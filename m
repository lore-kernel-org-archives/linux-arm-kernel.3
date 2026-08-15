Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BA5C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 03:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3V/eB2si6PnrWffympSjftN4xffJyXASce7EUYZ4LY=; b=D6gfd7RJZRNu2xVpNYNQbHBgsX
	1f/Vb+ATKovcoWtR7w4WUW4Ox2Fk3X1sZa2AwtjH6vpSsukyNu8XItbo246ilmi4Y0Qc1//N4n/2I
	GEQlDUV7WxgyRiltY2YqUym/B4TP++8Jcju1ke7L3rgYfrGyCsYDB2T687vstCW+cekdbEszTnHdr
	kkO/OwJifWCXcQ+f02/JgOuA9sbJRlDOdXtX+PmMWhPuHKOI9rn904vv47TsxaGLF1sXqDgImlet8
	4V2zAfNcvKNR6Q7SZ9ZtZuKJNnNjHQ5FLBmTAbzNtPTIpz0yn6T2B4N9LlZHseGBHpg4gH9bXkYQe
	3GJ9Yfeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv4qb-00000003R8M-0nVY;
	Sat, 15 Aug 2026 03:14:13 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv4qZ-00000003R7y-1dqF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 03:14:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ccf2360620so17580885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 20:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786763650; cv=none;
        d=google.com; s=arc-20260327;
        b=q1SNdWC7z6CBbxeyMeOig8p1rjyQY3H6cPCicjmte+SthjxTG1q8IqX74uj//jkp4F
         C9oph3JfzGiehIKttqjI0iAgSZznFYvGYWOQoTpYBmzUKizbgjij8YDlsKIZv8mN9Vml
         bwh6pmqim24tQfk0FMwE7nVk8E+8jpOwJ8K6IWPHj4QRMp0oafOUgTF2xKnR8uSEDikL
         yqTaea0dyAaDhJrGsEngS4dfo0joqMev6bO0w3ssz8Lig8oAa6BUD72wrYN8gwY3FTXm
         uEFM/PupDTvdOOYKTTHYQ7ujV7vpgdMjynyryhRnaQESZxJ06y0/4veseN0pb9X6C1J5
         R+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C3V/eB2si6PnrWffympSjftN4xffJyXASce7EUYZ4LY=;
        fh=1t8NUxAPv/t1YM0gR/dQe7QTE7hMqdkFbrNoGuPueFc=;
        b=jenBXNpGlJirGVEO2dcwbk7sFDU2A6i8As6dO+2VnoIfjOk/YsqJ7moIOCRjrvxLgI
         gS1mIDWeIo75j2U+JlEJlb0c9RyHKyYNnMRqIM3hcbgOeCGiFelsGIABwW3lHmovvTRA
         U4mkkKWyPdoayPqeBsMO4jAMgwX+TLtgghzvKHXogJvtlZwFR6Lmdbz0/vqgxTic9t7j
         EHbvy2qcXD6m814PUMRmJPYzWG9oURS7DFPT4x3o4CjiF8omDfl4pDddY7655YQujZ14
         WwLsVVfwduYz5cY0vGBvtK1BTOBpNzoQUsIRNQDyedzCBt2YNYckPRrftSixYWu0809t
         lUCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786763650; x=1787368450; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3V/eB2si6PnrWffympSjftN4xffJyXASce7EUYZ4LY=;
        b=fHt2D0RwLFwUIGGITwakaQuUpmIM8+1Fcsb9Ti/q2UglAUY8jTr5fFGvFvjO1Wx6t8
         MNtdtxZ3ow6gfH+UUOZB6aCdkJiQrsqk2KE9L4+v2wzBekOXg/uBD5+XrjEpVk2kxXOE
         QGFtf4zr8T5vP22+1nbM3nskl3jMo01hau5Afzl9ziLFd18UWmyiA++VlK3u2od53CxS
         N762Aje1UK2BH9qYvjvYcEvWSvju5ijD5zybhRh6loW07TlzxzoniGgwBjyy5hIWzkHs
         MUVF8FcluhtJSquXnsdwnmJEFaexo72WyuSvEOvVpXqeY/9j232DK/qEdNb/HZMY9Q4K
         LLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786763650; x=1787368450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3V/eB2si6PnrWffympSjftN4xffJyXASce7EUYZ4LY=;
        b=TqP+dWQXCsKtuP3n89eJIAwpLXk7QvlY5iSIdRmytYYCx8gYK9YxcyyhRpyfGfV0KL
         rGpxMEiQ+CvqjLXT09llu0UNFPZBlMN7r0XXDOnvbotAk/PzP6SuUMyibzszYZZQLX5I
         SmLSgrgF5NOdHRl6nRcRYJrYBKhEu5mJEknVSn+OnxdrQ/IZBoj6IK4rL8Iq36U8zWAB
         eJfFo/8typvqqezG5kd6Wc1e1mXpO2WjwVQCjYz8m2IpI4P7PRig7+PIksjS/hLQLRQv
         6dS1rbaChpB4kBXhS2Ji01lPxFQfLOwWhER9hHrWH/dBwIjZR6U723Dcx0WJEHKG8B3N
         OqNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzhnV/YjPFmJq8S7n2WZFkNqJSE+p2jxg8H1guPjtmh/8L2ihJi69TRxwz8oHA2LjrXUimTO22yXMAoEVTp4oi@lists.infradead.org
X-Gm-Message-State: AOJu0YwcP3W66WkLWtQt5DQktRzHT9/VwOQHZ4iXhY+qWacsXVx1tUiK
	jXEoFt81Wtn5LgvEjjIQI7hlBXmlZSKwYkx26zCQ1Jz3i4zYESuh+2BBDV/kmCd38RSyffSSJ3e
	naSIT7/qoIKU+an7UX58v/qAHdzqAMV8=
X-Gm-Gg: AR+sD10Vnx4wZ2l+4x5AU7Y5Y8yU/ct4o9S1LtB77DHsyfsZhCDcWc3bh00NLUr8EQk
	FlUQPla6EyLFjqziiHoCf6pw2dJ0+8QD6eVbgpe3ptTCUO27fYz09egLQejyVWLVLiR9sf4M3TF
	cjZi73/EJZLfePjMe56aomc8weAHqE3WNrmnhzYJfTz/VQ/t3yj7qzguBkyawLO9OS1sBKzBxxu
	N9rkogpkiFtbdg8lvCOITmZjsevGND9OcPP/rAPrh//7RquXeLVwPT0p9YNo+pz2KnySJUGkYKQ
	qcnCMt4AuaxwW/z1bsHcIEKG0eGOy87iOVB7VoBVUKKfkk3uuTya6vOAnZUGq+RNeJYc6y6pZsZ
	4gx5JcgpPxaG5zip3GeWUXXXqryRwzRQUvSctrnKctToxY9kIayfd8uioMDjP0S3MDHgmUqI7mq
	VOUDHIiwHE4S+VX7Q=
X-Received: by 2002:a17:903:1b04:b0:2ca:bf8e:35fe with SMTP id
 d9443c01a7336-2d3b0d9591emr116157115ad.16.1786763650444; Fri, 14 Aug 2026
 20:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260813042012.17631-1-phucduc.bui@gmail.com> <20260814170001.GQ265046@horms.kernel.org>
In-Reply-To: <20260814170001.GQ265046@horms.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 15 Aug 2026 10:13:59 +0700
X-Gm-Features: AUfX_myDmZ1LURZeKvvYo1pSU4U_UuWwDBLuj9naedtztPbUm-U9GqL07KDvox0
Message-ID: <CAABR9nFxfzf8QP-wq5iaJRTL+HG+a+tNqqX2daj-=Cwp46hPJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net: xilinx: axienet: Propagate errors from
 optional IRQ lookup
To: Simon Horman <horms@kernel.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_201411_433861_BAD12D9F 
X-CRM114-Status: GOOD (  18.33  )
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

Hi Simon,

Thank you for you review

>
> It would be useful to explain how this problem was discovered,
> and what testing the patch has seen. Please add an Assisted-by
> tag if appropriate.
>
> Link: https://docs.kernel.org/process/coding-assistants.html
>

Greg Kroah-Hartman previously asked about how this issue was discovered
and how the patch was tested, and I provided the details here:

https://lore.kernel.org/all/CAABR9nEfPqXAt8wDo597qDS3b3KMaHeF6-swAFg9RLanap=
DnBQ@mail.gmail.com/

Regarding AI assistance, I addressed the same question from another
maintainer here:

https://lore.kernel.org/all/CAABR9nFgiNv6cnYa3+ZY3KnjbKpcF-JHpZY8TVcR7H40vO=
oR=3DQ@mail.gmail.com/

The answers are the same in both cases, so I hope it is okay to refer
to those replies
rather than repeating the same information here.

>
> The same check seems to have been added to both arms of the if/else
> condition. So it seems to me that it could be moved out of that condition=
.
>
> I would suggest placing it below the existing rx_irq/tx_irq condition
> which appears a few lines below this hunk so that those and
> dma_regs errors are still propagated.
>

Previously, I understood that errors should be returned as early as possibl=
e.
However, with the current implementation, I agree that your approach
makes more sense.
I=E2=80=99ll send v3 soon.

Best regards,
Phuc

