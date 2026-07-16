Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A2EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgvkBWHWdR346IwLVQEHaZZsFXG1V1Qn4Ec2u3LFb+A=; b=XosZk/mx/kyOM5WLUg+yUw7DMZ
	bEdNRhx8Ki7DohOkSLNdmUl1uTS9SKC6MDNbbt5IXR+P6jI61ZxFmHK/7soKfFwIZXSc7ys4FQRBa
	gPs0rkZC7XbpQLnjTnO3XSNo2zWehL1yBSs8gmSv02TiUqmjoWVD4uptBa7L5507S702Y+4LjDQtS
	srsL4sMm18uPc3Wbe/vkdf4oMAUyO/WuGeEzKK79uW1sP8Six+YRg2E2i4k3OgDY8U8XWKYThzvmX
	2c9BJtAO1Yt8rB3o9hqw8V8uOMtJqXjyEzRXucNUd3AK8AwNp8/kBXD5de/Il60q+FffHb13wE9fA
	WuN2k1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFRs-0000000GWv1-3EqE;
	Thu, 16 Jul 2026 06:19:56 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkFRq-0000000GWue-0nZR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 06:19:55 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso3107928a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 23:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784182793; cv=none;
        d=google.com; s=arc-20260327;
        b=dABUHAuIWB0nz2yH06K/kik8pR7+4GbJnyn8tFJ+Wbo3INDcHzw23hZN03V7XxDdlS
         A33x1EMl7uYn05IFsYV1nPm5L4QaQG5YCrIHoHykuOEfQC3amzb0gEm9GF2IES2ODARA
         /RPrkmWRuuFEhRD+M/WLTZLTcaU9BXN/qwiX3xfVRo5X72AGYEpGhIet8GsgpZ+AHUJq
         tO6hMKYGocxu7bOG9k2DHnRWolwFzXqMVl5AP9jr5O8GsXmQZu3Z4MNkUdEQcVDWGdj6
         pL8HhxezNIPzb2gTFpGEdVsmX9rUCe1ciXdZD9bRz/xmKGo/W3OhGUmkCyqGysNXE5uq
         QrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QgvkBWHWdR346IwLVQEHaZZsFXG1V1Qn4Ec2u3LFb+A=;
        fh=PJPXIUwm3mMaFXkaxIyhGsU3Vx4SdJshxoj8ko9WTho=;
        b=DL6UjPaYxMZQZGDvv1LfNLOTn7Z6D5pZkfluAw9+IHAyTuVQtgrv0mOMZXwuHiF0Wi
         rg9Jk8P56ks8dWIsTES9RdBlqnIUNItc49Euvo6Tm4WkExwtmL5DbMy7/t5ErGgEoFWp
         RXSkUTmL5p0IX3qr9oeYKhBVK3wmmglWP+DMe6naFQ+aRe22YmcGP72aRlqXG+F7DrtZ
         CJSYCo4UBnU2gsacm4Uv0dwlbxCRc1cJUR48Nd5fej7zDNxoa4v4jYWWn25XwdjwzaBH
         n7LP34IU/shPDBQGkiPmFhT2QR6M6fFbAnB6MK2o9cw1hXtZhx7rtfql+0s5zDKZRFep
         0d9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784182793; x=1784787593; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgvkBWHWdR346IwLVQEHaZZsFXG1V1Qn4Ec2u3LFb+A=;
        b=IqT9NWBVibCifNrF7hySX1tVJh4kUTInqFvRgj/WQ9rI/PhM949pxUSwSzvdySalO6
         xycnDUwjKYQiPzRdtBUPKCpityxNTSivGgORU1SC9j+/udg421NQm2Ub37YrCPR4C3C/
         KX8sSSRa2qf0CpTWVAxQAUSWCtehHwBWLh+YRdMY0338KHvjk9jSg8cT6Awg8yKfrev0
         F1+R5RE5X4MRLZ4B/XsLat0ZpTmUEA4aIUADU6TxP5BsGyxsC/W/MtCKXAaTJHKC5/cS
         JhyoqKVYTF+EliVDthZ9OyBeEmWh0KhUeD89yF7YnrkEkfLldHIRP3SVv7PqUR74At8q
         o0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784182793; x=1784787593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QgvkBWHWdR346IwLVQEHaZZsFXG1V1Qn4Ec2u3LFb+A=;
        b=lhdB7E04TodLYbr5/k9nkOZwqX/h2TgAUo9CfFqNZxrexNRK3jyR1eDlMnVxTVRByk
         KbSDYWUbK95VnS0eb+RMC4sb9w2L66DdmmOqnCiKYhpTAR22EAXnx90/ldrsW+SN+FEn
         3gqieuEF1n0DLFx+e9lD4e//GQD2tA9JYhxwGESWjwEA0lKCUsEAEZ9hu6jXTlpFlX8E
         0u+SIE6sTWpvBhm0jfr3dlpCRt7uZNvg5UkuUlxqZf+dbz4GxV/z7qQ5S/cOtN+9fec8
         tTRaPFX+NAmUiH3Vl1NNrmLITBtEQPcJR6QGDkEd+J1ZMZFM0bwq8vSwGUaIrWBpjxF7
         Sbfg==
X-Forwarded-Encrypted: i=1; AHgh+RpVCGbIT/YKlPDMqxjOXqyh0uN+3djnl0m9u7BNQAr3xuKNQG1GsoKNeQpUP5/HHGkndRjpaKhZ8iTorl6GjB4Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxlXu9sW9xM89Rq6KGzn6HTItBqJzKIMysIt54+EoXAdjx5UUg6
	aevTgTEPqODdcgO3Voxb9ofMb4JJd6iIGVbtW8kEcsncMsF067tUh4QnAYsrTtRV+kq2Blu25B9
	yhaz7qgCtDGJrguWrLMSAYiz/Ob42xgs=
X-Gm-Gg: AfdE7cmwmGWlJrknmS/ffBDdSRFHImDS+d0tH2mFRkH/ejtR8s5/jpN9yilzK7dsb+j
	s0ijunt8mDGsRZsJl+264A+NVw19vJNI/91D4byQK0PrnqRucMYdNI8AKaDBuwr85vk/diFvujA
	TCfCGiHnsh/tRTiuxcjdbEnAeSJ9HM1Doug0aVmcLC0RYbT5xfnQHOcti13untDZtDlRu22d6r9
	6nh5Yl//uNDSCYR2TWaguJDETwKvY+fWKLoke5mj33l97XL2IVHuXVaxcc9dnyhr0oxLvYtPScD
	aSSzz2ZMjmKKed57
X-Received: by 2002:a17:90b:2b43:b0:38d:eac8:2dbc with SMTP id
 98e67ed59e1d1-38e29f6c683mr4862337a91.9.1784182793361; Wed, 15 Jul 2026
 23:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-3-phucduc.bui@gmail.com>
 <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com>
In-Reply-To: <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 16 Jul 2026 13:19:42 +0700
X-Gm-Features: AUfX_mzLT5bgNmawwyrEk5EUD4UBu9qW-wp_xIJKTxIxw3V-_Jn5uIqdk4DToog
Message-ID: <CAABR9nEk19N-hBm+QKv6U=7SBgkQwC2Ohb_NDz8OLEetavLLAQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
To: wens@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_231954_251678_2B3D5F3E 
X-CRM114-Status: GOOD (  17.96  )
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

Hi Chen-Yu Tsai,

Thank you for your review.


> >         ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
>
> snd_dmaengine_pcm_register() doesn't seem to print an error when
> dma_request_chan() fails.
>
> > -       if (ret) {
> > -               dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
> > +       if (ret)
> >                 return ret;
> > -       }
> >

You are right that dma_request_chan() itself has several code paths where
it doesn't print any error logs when it fails.
However, if we look at how the caller handles the return value of
dma_request_chan():

---------------------------------
chan = dma_request_chan(dev, name);
if (IS_ERR(chan)) {
                /*
                * Only report probe deferral errors, channels
                * might not be present for devices that
                * support only TX or only RX.
                */
                if (PTR_ERR(chan) == -EPROBE_DEFER)
                        return -EPROBE_DEFER;
                pcm->chan[i] = NULL;
} else {
                pcm->chan[i] = chan;
}
---------------------------------------

As shown here, the code only propagates a single error code, -EPROBE_DEFER
regardless of whatever other errors might have occurred. The reasoning behind
this is already well-documented in the comment block above.

Therefore, keeping the following error log is not particularly useful:

----------------------
ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
if (ret) {
        dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
        return ret;
}
-----------------------

This logging statement does not make much sense here because if the returned
error is -EPROBE_DEFER , we should definitely avoid printing error messages to
the kernel log.

Let me know if this makes sense to you, or if you'd still prefer to keep
the log with a check to avoid printing on -EPROBE_DEFER.

Best regards,
Phuc

