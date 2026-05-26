Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CAFCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=; b=W20GwWJyYM7zhWQtiE+/eb6Rzq
	3NWMyng4rxmggZWBTGLF2XkWWuf1jsRv0oxfrPhxCRwkHWhmrVYx5eBnWQqbgLS2pM9xpcsPc65By
	9AYKSRJUaW7QihT/YXFLQg7G4mlny9KCtp0HwVw/I4BcnL0jxP/jzFuozc2x2Rs1Ew1gQq6B2IEl9
	UEItxUH27OPd+Ex1ibL37NN/BknlUeoy0rPinF6sOJ9D/MWQnFKI8ojNQYfh/491oJveyVdhncB53
	em5EmXMA3bgQH0d1NT7hH5LMkgSFc3jS92p0619Lucii3ggbH+H1rp8C40jRzHHPbxGOW8MN2yFAw
	C6ebWDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqiX-00000001tUZ-2tcq;
	Tue, 26 May 2026 12:17:05 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqiU-00000001tTV-3Wss
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:17:03 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so6128092a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 05:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779797822; cv=none;
        d=google.com; s=arc-20240605;
        b=SOuoqyDyd0a11t0ZBoNinWYyGOMPjaK8Afu7H+RYtVZ4PpUedulbsTxkcziwvU7XQ3
         SOpzrNG4lOXRt6I6eW9cTn3LPOYQpw50QOZjSRMqV/rhJbzljFyFBqugBQSGgp2tjmnW
         IKDprkF+rUpNh4vdw29PbnOCXK2WIrlc2bsswgLi4A3JMRPp+IcR5jrLSyDR7gjfVHC+
         3NzvNQmCL0tF88nmsBXJt/0Y8mAa6EEcS+gLYY7KgZV+VRb8mF9Ts7OkiN4HyYAhjhr7
         59XaCXKVmVjDHU01c22BrS9N6Ye4dl99k5XvG1rI4JVem4Jb42eQuhAWBCjIIM6PoF4z
         Z/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
        fh=vVHym/pGOcf5nHdfekktns5KAFoUCaXOqScwicILP+k=;
        b=Yt4Mhsra8jKpEJ5LFGpvijxyL87ODFOTGh9qQjwqBrxgrOq3sPTmDE9GCSeJNNnMFF
         XsRh7xE+PHIIEPJdZqJD3IWhXDhjYm5KxNcYoSQOvWb3qTAwc+kim3/usx40CVwR9SHs
         A7mPBxAplQRcqskKjQ1xahWW0pCloH4hDzG9YwwQTWLbk4jQONoy1+ScTF/hI7xeoYtD
         fyzBSZ7ZjiUCdI2Y8X1hjyw25u/q9H4X0MPLhzq4I4YsEONEOCZl4QlJSpmfRgMYpmpO
         ZyooTXEuCPP+azLyI6IXtW0qmKFmRhu/lcOYCql+yPFvWvaJp9HDiOQHTZfhNe1OAb5d
         EcdQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779797822; x=1780402622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
        b=W/xHggl3tJE6xe0NeMF/YUpDkcYBw4Phf25wgy0y96BYQocRIw6oarWvIlRYwn7ZlS
         8bJZcRcHh6tdIfGfVife/924/g1Y3jxQSd33n+Q1euSjXvxefDXlcmea/dmD7jvexpDq
         0Am0hoTwh0lR4zEIATt3CBPmMkgjbICvOHu9RuEl76gm/1u/cWlsfu5E2/Sijd9992Vs
         Ff7XMYE9opTu0WG37cFxeiWmUNzn6DUB7+gSQD4eaO9t224nFm4IpkUGRvhF/6Y9eh/f
         gOf9V/PF9dgGUifUvPFQoP0/XdwITj6x5g7xHPyicPKOIcrltDQNg78KEawsp8o6n3iX
         Yk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779797822; x=1780402622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DtObxo9XE3EzIiwd27kjN9EEcOHxqFMVaH3d/+QZW9I=;
        b=mZSd91hzK8yR6fJhniG5mpiMs8dlEckoLHI0W7pveEeEQm977+9XLx0hckTSlwxTij
         ZJ2VLI+8Xa3rzQxqzvdoQCbVGL0cWHtzfn4AV4QYYOw+oQaUihJncl3vRvEr6mWLvRce
         sBYJQXOp/awmHJBPS7MayPSL8apOo2+0JK6bgfgSIS82RiWjdTDu8F/zPt3HD1LOT74Z
         IfsCkLOLaxB1K8SxgDynTw6YEUiXvtLDcYzESuA5CKcWGeP9xwfbvpiFgVStm8FsKUds
         sikBbs7/20oD1un5IjhqnHyF6IaH0ev7f7hWY66/6VrAJSKOFjmHSOEth9/zeRoEQGHe
         vsOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tyF+bA8sgw3EhHeJh/IaIKzbmC3Rh0t1S7fNSpO0MpW8wSzHMuqkENSNnr/4gWwLW5L2fA3xlsDHyjEQE4xUj@lists.infradead.org
X-Gm-Message-State: AOJu0YwA36jKInaTA9SN2Cjw8w/4QbTRoXGC2XlJpisKMXs5s8LJemxx
	2RZXynA5sT1xhgHQ0/sC4bda/eZU19gSxv6+VlA5kXfJneSHnJedKgX6+jK5N4bOCWq3oDy0JTp
	9prydBgOeGYZuDcU3q3qx8IfXcBOpW5I=
X-Gm-Gg: Acq92OE+XvRPQnOgbtIlEMtKUW7QpFJxS3Kebi6zkPe1N196hn5UZnxcVHASO4nJA29
	CYZO38vdrAkII5BJpMZqYlWkmESCv8ZUBhG866RAzrDrsCnblh0R4eeTUIvrKpuAuWBvZwyBITz
	MiCTOscPDYa4Ywl+XUK3Gz4jhBPZlxCSHgWAdagZE6EUI2F5erQWXkglUUyE5fzpZr+pBOrAvwz
	EJesDqgeh473H34jXyQDEqaRVTu678XVk2pdowtBcWEf8sIwb2Ej15TYU04LVETZgi489KqgQ/x
	GkIRPC0vqO66S4/Di3XriFwUdZ2mDosE86vANKXrEZb48C4Z6lA4Xi8whqUN899aBsjG0LNl
X-Received: by 2002:a17:902:c948:b0:2bd:2de3:5181 with SMTP id
 d9443c01a7336-2beb034603cmr207644055ad.9.1779797821644; Tue, 26 May 2026
 05:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260522095401.72915-1-phucduc.bui@gmail.com> <20260522095401.72915-3-phucduc.bui@gmail.com>
 <CAGb2v67UmMmM7bQOSf3VxsN9D8s3N8nMMX079_kiMcPU=VszFg@mail.gmail.com>
 <CAABR9nEB8jizn+NrVgrjcOOJRtaU0u+TH705unMTh7HYO=8Wcg@mail.gmail.com> <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com>
In-Reply-To: <CAGb2v65zK7iOce_UZ+_F=dWtKYFGZj-K4k45MewvDbhivXPH2A@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 26 May 2026 19:16:50 +0700
X-Gm-Features: AVHnY4L36KKu58qpYxsDJHrLwpA0fiNG3V0fNQatxdA3GV3-2n0FXUky_32u4G0
Message-ID: <CAABR9nEsKjgErDB3jnHrx=dOUajvvN6GbP+6XUb5Ay3VYYjNJA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: sunxi: sun4i-spdif: Resume device before
 kcontrol register access
To: wens@kernel.org
Cc: broonie@kernel.org, codekipper@gmail.com, jernej.skrabec@gmail.com, 
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, nichen@iscas.ac.cn, perex@perex.cz, 
	samuel@sholland.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_051702_885552_9FFCF1AD 
X-CRM114-Status: GOOD (  17.47  )
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

Hi Chenyu,

> When you submit a patch, it is expected that you already tested it.
> If you only compile tested it, please remember to say so in the
> footer (or mark the patch as RFT) so that others can test for you
> and the maintainer knows the status.
>
> And if possible, provide a scheme to test it.
>

Thanks for the guidance.
I=E2=80=99ll clearly mention the test status next time.

>
> I can't say that it does. But since the only control that SPDIF gives
> is the IEC958 status, and that doesn't appear in the standard mixer apps,
> it's unlikely that a _user_ will trigger it. Plus the control was added
> after the basic structure of the driver was done, so there is definitely
> some possibility of a crash.
>
> But what you wrote in the commit message doesn't match the actual hardwar=
e
> behavior, like I wrote.

Thanks for the clarification.
I'll update the commit message to something like:
"The kcontrols may access hardware registers while the
device is runtime-suspended.
Ensure the device is resumed before touching the registers."

Best Regards,
Phuc

