Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815FFC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 18:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lx22JAqx3HdqfLp4etPkKWCHezogZYIQRxdcXNcbJpY=; b=n7W1wzOld7mqzeih7qxEk7U8Dt
	RrJ0DNoxHSWizVYIn20L+mdVPjXX+5Qom/dxQrYaQ1b6YPw1q6mzYSqBDZmEoDOTCirN05wXATgln
	sseL+zCgXpmztOeMB/JyHOFWNgf4MfQVco//6MlxDPiAIVVKul5UKBJwBswszHd2cfLqs/y88a6QK
	BOe0ndEUIAxGYgcQIVZiDcSGRs2o7Ow03yxcEOVMyntuXRck0dCGspGe555gNaM6E5l6M7J1CI63/
	dXYEo757BglYKe+dsdNxVTESvlydXXtq6xAiyE9k7fmUcGzyDW6A4Igf440G8LKrYcAdigPwBzVC4
	EBIgKePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7zrw-0000000GZq9-3oFt;
	Sat, 19 Sep 2026 18:33:00 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7zrt-0000000GZpe-0fQH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 18:32:58 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466cc9ab667so2101953fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 11:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789842775; cv=none;
        d=google.com; s=arc-20260327;
        b=EkEtf/b40dRYmESqquq9qyCqgUZkOPJHQiX0NQlmADGKsm7B4TzQy7/OBfZkPLNvZT
         A2W29Haf9jqTC86NTDcSEs4lwW9K5F6g3ZvvXMGhu9Nlr8BHXuiwN/mBbD6fMarGF6bu
         7jZmhdcMysNN7h/R+5CBkAreqDTdT/1zQ7qvimNDKZg1yYv5R7bvQXwIzTG0u2qubYLu
         znMejCFUOqkXYQkfc8lV8cLpxu7RQKFOn5MrqomaiUz2gdas0bh3JWi2nE6E3H/AlAYI
         zKwDfe3YPlNC7DNYso3y8cBAlaV5SGT3cnIsiS3fJe2ErdgbMDZeMQgraa5TioIdxtyA
         ga0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lx22JAqx3HdqfLp4etPkKWCHezogZYIQRxdcXNcbJpY=;
        fh=+/gIhgZsoq8TH24sHK648S9QYjdJ7fOmuDAB5JPpZZE=;
        b=EnKObH01JhHS09sD6RR3TQdBI0u9jjfsB4VTd50wRyPbU3xOKcVx0oGAk8+cT2GYqO
         vNuO8pGyDU92C/I4xmYwrL0gqWltLjzgX9EG3UUZNa67dLh3kU6/tvPlW0D47HjUN01Q
         CRD0Upw6rsfPABmXk3aOHA0GopBxWWnzX1ZrY49Tu9N09TNNbJM4jTrD1EG+tJONsVW1
         JRT/R2G1qWvVYA8DmnaFIFL3g/gr7feVO7smrNpoYBLdAALs84mmehxwTS+vESqYxzz7
         tbTnXS2MiPyYlZKDsNzq/z0l24NEwmxogzlSz3uyVtn+C6kU5YY6xigipICZhLQYx6e5
         luPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789842775; x=1790447575; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lx22JAqx3HdqfLp4etPkKWCHezogZYIQRxdcXNcbJpY=;
        b=Hdv+tkiIKkOqPFCVNqGKIYv+Xh+WvJIfHlzidGLEEr7lDwvP9OVokJYU4gPXKT15OA
         KBuBhI7wg42TYJU+VL83be0xz9K9myGpE7ms8uZaKZcOZJGD51LsGeTBW/+p/NyuJO5j
         pM9hVgrT+IWQFLbdSIJdabgWBHpX5ZeulPFTO18IH5dKBBgs+Pi4j092EMe/LfegzAAa
         7jBlA08AAKkNqtLwDMy6mCTaHd5b7GUXciI2RztZkDUDDMFryhchqaql71Yvi3H+M6cD
         e/ONmjbT4mb290BGDnJBjHkGhAMyZmSEKNqZu8xEWRXSRj9DpAm9ZKkdk5jHYvnx9EU6
         ZS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789842775; x=1790447575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lx22JAqx3HdqfLp4etPkKWCHezogZYIQRxdcXNcbJpY=;
        b=QVmgMG7FLQwgFDOy9rR83SsiVKut3KIls6rqkLVHZdT21CrJiB/AczMjk3MWdt85po
         jrXXwSIEHh/sXMVs3D0z/TDorybW3ggVQIJ6zLLikc9uIfh3G3WiiDnnZEBCJQiCSM3T
         9eY5Pn7+SNjCnucwJSyaSYZwkcLZ52mpdBowgiUczv01hrrIt8swPBnRY6DOA7k2k9x2
         qNUGBY8V/Uomnsz2Gfqs5+06d0JCCRnpsyhy9OwNUGbVxPygGuGPWNyvaOVlx6xXpPLi
         WFl7e8SCh1KMmzZR4ufITf1s9r+9qdr9gTugg+J7Hj81hfsZgywi0E8AJxSbWZ+IHhW0
         jxcg==
X-Forwarded-Encrypted: i=1; AKwUvBynGaMsLk+gLYKX6g3067A21ptlo6uGnbZIQbqqNoQRZgiYExksKI/PWjREiTgw8zUMfgeq45AmnfXhU1nA5q3k@lists.infradead.org
X-Gm-Message-State: AFuF++lkAchahZuu0eQ7/hQlirdXLnUk27tvDnXw6Ix2kOSIdIyWmcmU
	sfwVGCLh/e2a1pGb2CMQDXwdcNThL0cfibPpv9BszUjGifDtC+P9/UtnNLPbsVUx5dG0kGzWV3U
	OByjPApnSJRJN7Olh0c72qWXmZNMQELw=
X-Gm-Gg: AYBFou2D6yeA20iB+B6Fv06d/NuXP5l/6lYQcupYhsR++11paaZHSD2XaY0ygnCZcWz
	osGPlV+CeGTDtiSnTCN+Hx5x5KaVMIdP5OMTmNx3HX0e6u1rPK6IRczbfRvV5Zm/W4rJekPzTPl
	DIjQp6p4YFWiEDDiB/OOuu0FhVulRxc5TVjTTdxLE5zlEVS9LhlosCQk+U7NUHgG8l/wp039J1S
	8L6gD01Tly2/l01Ffg24ZkujwG4e8Wbg/1VtT7Llcs8e5Gpg5bWOk+tQTUpmZwUSsVb7J0IZ/GJ
	plNTTDXSHTr0aDICXjhiioTkJo94kl0bILbJVA6Tak05W7uAcJWDVCo=
X-Received: by 2002:a05:6870:8a0f:b0:45e:d660:b87 with SMTP id
 586e51a60fabf-486e5134a5amr5951125fac.9.1789842775310; Sat, 19 Sep 2026
 11:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com> <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
In-Reply-To: <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 19 Sep 2026 13:32:44 -0500
X-Gm-Features: AcwNN1UwvAj9Edbq3yWCycTjTBcB7wt1MSsw00_ytosOZYg4EL85_GmD974H8ho
Message-ID: <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_113257_594916_965B95C9 
X-CRM114-Status: GOOD (  18.93  )
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

On Wed, Sep 9, 2026 at 11:57=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > I am suggesting to consider TX-Is-Done when send_data() returns, i.e
> > tx submitted is seen as transferred. You anyway  don't catch
> > transmission errors. That way you fill all slots without blocking on
> > the first message and achieve this same throughput.
> > Without knowing the clients I am not sure if that can't be done.
>
> We need to know the txdone and thus we can't do what you're proposing.
> In general, queuing mailboxes are used in cases where the remote side
> enables a resource like a clock or power domain. Different tasks in
> the system may independently turn on/off these resources, so allowing
> them to work "in parallel" makes sense
>
It will still work in parallel - you still keep writing to the h/w
fifo without waiting for previous ones to finish as long as there is
space. Just like you get here.

. ...but each task needs to know
> for sure when its resource is finished turning on. If we just imagine
> 3 clocks we want to turn on.
>
> clk_enable(clk_a)
> clk_enable(clk_b)
> clk_enable(clk_c)
>
> Those 3 calls can be made in 3 different contexts from 3 different
> drivers. We want all 3 enables happening in parallel with each other
> (not one after another), but each call needs to know when its function
> is done.
>
I don't see why not?  The three requests will be queued into h/w fifo
in the order they arrive without any block - just as you do now.

Btw, if you mean they need to be enabled in parallel literally, they
should not be called from three different drivers. Instead they should
be modelled as one "composite" clock.

> Does that make sense?
>
The usage makes sense but I still don't see why existing api can't work.

Regards,
Jassi

