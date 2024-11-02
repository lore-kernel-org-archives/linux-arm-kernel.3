Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19601E677FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2f8PcOKU/FF7Pc238+N7r6RVxJuBnH+dra36GzbN3Q=; b=q7k2XWOGOIuLVa0LgZXgWmmMFX
	Hq6HaZP3EeQPd9avmQOcrcP9gxvs43qrumR4reJNKZKzp0QQEmluw7i/Wd1083khuYdhfHY/KtM1m
	DDA7txkZCm5TQyv/9hTgnNELHrfwuXdoct0Fa6HiKiv4IzggNGvCQIZmMNN1/oe6ZRKOXcX7gQZpm
	Q9I4BKukoSp/zREtGzIYPz97H1Gj2FnbEBh1QGHzp/pMpMaBgbDOvIiBlaw2oA+hEU/aHwQ+1WF4i
	4uHD7U81d5vNto8Nl2KUgP+KgldNKazodwVihDQ29QcIR17gA8W3HPsXqm3UrYhobC3LOqNpuxY7w
	IB0NUlkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7FGE-00000009s7H-1d5f;
	Sat, 02 Nov 2024 14:37:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7FEY-00000009rvh-1r8m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 14:36:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so24023935e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730558168; x=1731162968; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r2f8PcOKU/FF7Pc238+N7r6RVxJuBnH+dra36GzbN3Q=;
        b=SXdviJ4X2N9fbVfZHmqlyO5CdorjjaE5ZtQDBRec3FWAL9EH/rcZe5kOJ08WjOlkWA
         OcScGic3o7NhM1I5Mm4/ITMyTO3Wv+tYu+hUBMvXoisCaejNMZe7O6G3472TjR+0+UUN
         SMmFw9gcCs44rcrIt+L1OdoDsQzFdHGGm1evtiSftmzl5gdhAykdtNwnWnF3EBu4AdDe
         4MxHSNTfPqhSpAkfJZ2w0NyahxYpjldWcPcw7VNJAqHjta5AmKkJIuBYGxmZxHo9q33N
         EwWVSSzXT4zniQ3TrgclGHibt6zxHbLYewMQ+o6ZRLLBk5LPCtX8ywr6LhPd6AND1V04
         Q5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730558168; x=1731162968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2f8PcOKU/FF7Pc238+N7r6RVxJuBnH+dra36GzbN3Q=;
        b=F0lzxvZOwpRk6JGftRFl/1cTKmaKmaPGgE++t5mYCyh/7NoXaZ5LWqsrZGFwJhcZus
         khlxrzgkysNQNUcAY/Ln3KYpzM6V4GNTuwaLX3AjP+JbJJIgxvppnusQD8aro6+OO5p6
         D2fiFxMltK7qJgK0rwNVetRPQ0/dDZpGQ4HkRtkBAVFo9z8KeUCS17U6pUr3wT9EC+vr
         dhHM8OMqvQ9doxmLaVvxNc9eViUnYaNsGNkE2mijyXoFgz4aXuQMhaeWf0u1/TUx2ufF
         HQF1vMMeMcbXY78rgTWFFvRg/+AyonkSGWoc+UMMvzpVS+as9uJxbtiALn3cdBW7peog
         UwNw==
X-Forwarded-Encrypted: i=1; AJvYcCVB94+3pIEqhmbXUPsQlbKimAvPm3Wf+5BQgdpD+bBjTrgbuLzedwjxfPLN/zDC7j4e/8K8xo7cJdMqQ4v35FCS@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0usXIf04ln9pY/zIgOoVNIyYzc+nX8AsOSl/xlj3mkqAS8R8H
	M37oEVrjHiQWw9T9WZhtHhKMWNCy8Xvqb0KKBBotmTBpd5HXOt/U
X-Google-Smtp-Source: AGHT+IG2ZwFxftz+i126vYwTLkOIpd6nzrVgPGTfjFmQz2ucEFkNbpKfCCu2yMagL13buIP7HKDmjA==
X-Received: by 2002:adf:e28a:0:b0:37d:45f0:dd0a with SMTP id ffacd0b85a97d-380610f2a9emr19284579f8f.1.1730558168360;
        Sat, 02 Nov 2024 07:36:08 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:492c:2677:72f4:9f57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abb5sm8202298f8f.100.2024.11.02.07.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 07:36:07 -0700 (PDT)
Date: Sat, 2 Nov 2024 15:36:06 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	elinor.montmasson@savoirfairelinux.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Message-ID: <ZyY41nJY9ghwe-Y4@eichest-laptop>
References: <20241030122128.115000-1-eichest@gmail.com>
 <ZyXTFhEm9UCBii2c@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyXTFhEm9UCBii2c@dragon>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_073610_507356_FDC8BFB3 
X-CRM114-Status: GOOD (  16.00  )
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

Hi Shawn,

On Sat, Nov 02, 2024 at 03:21:58PM +0800, Shawn Guo wrote:
> On Wed, Oct 30, 2024 at 01:21:12PM +0100, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. This
> > change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sound
> > card node properties") which moves away from the old "spdif-controller"
> > property to the new "audio-codec" property.
> > 
> > Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node properties")
> 
> It doesn't look a fix to me.

I agree somehow, it was just that before the referenced commit our test
succeeds with the imx_v6_v7_defconfig and after that we get the
following error:
[   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-card: snd_soc_register_card failed

So maybe it is not a fix in the sense of a bug, but it fixes the error
message. However, I'm also fine with removing the Fixes tag.

Regards,
Stefan



