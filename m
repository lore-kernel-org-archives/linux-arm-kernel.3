Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EE3CA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 01:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D69tJqwlSEswdhTD5958trOD3brbFNRONjBlwGMF72c=; b=JRqw2cLnqRq/aZ/NHQ8w3zv7Lv
	Duk2Pi0qFIuZjz4kKYmKO05tRvmaVWi7mcTAdXClzGa3B47m9TfDNyQ6XGMUcFReMiKF9iS/YP+9Y
	LSvn6zfz/6am/knP74sQ2z+sIO3pLW1bhkrweJRd/iigTJSRURBKFhm8roo+sAjMd2jN/pB4k/tl3
	JGGLW8/cJCDk7vA9462llGDDf+YvlDIwL7Lk9P7huKw9oZZkwai6Okp2dBzMbcw5sd/ol7owlYxKS
	Peo0yxakc8RcwwFCtbBW3q4qFbfEc/8nRyzb+zzVNgKLyleuBhglHL73yEOTn+zcQuqCgno9i3iFx
	TRZqPgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4t7-00000009YLu-0Mzf;
	Mon, 12 Oct 2026 01:31:37 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG4t4-00000009YLF-2Rxa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 01:31:35 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-46556b9e02cso1059247fac.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 18:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768693; cv=none;
        d=google.com; s=arc-20260327;
        b=iubHl6sAva4i3L6cmxY+qW+iAqeBJAI0fPYBIUjHI2fqrqm0TgYRdPH6eukGoHzqcC
         auzoG60bP50oA6f7Pi/nB5co1cE5t3KNQxCItn53hKKXKuTh0xBFmh/HLrkilacENGWD
         DeU1y7smmgPFzFv/4w89pV1Cba8IBEAOtA6ZeOorqk4TMhNitL5y+aUc8Rz/tl9V7g8k
         hu2iHzQITV69Q0h1Ycc0DrDWeMpJAS+BpCYMz3URAQe/3C3R3NtX+bUqUu06CefwkANE
         mgldGvgTm2V7sxb24dejMhRh51YqteVUD3u2Rt+8z28ukK1df1297IhrQQFm+YIr8cyi
         0Hvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D69tJqwlSEswdhTD5958trOD3brbFNRONjBlwGMF72c=;
        fh=B0ccrjCrzUlrk/gmSorKk5uSwapFu7ydE7ZtJcjcQsU=;
        b=ked9oXHbFhQbXAh5Amyk7CdXQJDKsoCe3otY8NiSAMEoivfvA9BR+jsZzpsMbpmywv
         RXZjIvXyxocXSxsmG3+WTtTkU38kW+u1R7+zN7Jzgwpu674dYu1/HGH8DvEoVCBBt/Vb
         VON7T82faKGjCqk6uE+ALgZwgt+lEoHQHBYuVztA90HIaQTPeoCqytrap9QjfM94yX38
         Pr2u4CY2FjehTpoZcWAOpQzo4wdlyLb00fGo9/oIcTcf1VWFgaYiSI5+9o4Olc1ka7h9
         62lCrY3yqSJ2BBnsaDbli/mtdKMECES0EYIKhccO7xzvTErUO49b1aK6QjllYcyQyMNm
         Rqww==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768693; x=1792373493; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D69tJqwlSEswdhTD5958trOD3brbFNRONjBlwGMF72c=;
        b=oFx8uTiMxJq5rpF62mbcFMJlCodIZGh/rKrldgXkMDhvNAErfiWfdPs7dIJ3mpFndC
         oyPNf81lx7PIZLy5DEdqyN5EL+eyNcpIVws9ZOW0CnP4MplIKqX5R/7SmBX7YNsfhabF
         3oNWdHmWRtl5pTFg7sG5AL3nelpKgQLrrnllIK62W3oU8TBQ5E+8lB+KHUq1PofieloM
         ukbcDwLFEd8lLoM2dxRXoUv9fAiG9/CN9T9UcTu5DjIbqLKgeiDpCWwMjHUtWrRU4xBk
         QhhFbsVUP6tmvV/QXWG9aasMyCwp2ZtnNI/sCFODIpTyB7dkQkw8ITOrm5EJtTfUDx3R
         nPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768693; x=1792373493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D69tJqwlSEswdhTD5958trOD3brbFNRONjBlwGMF72c=;
        b=taetq5gfgKo6zkTFXO8k7QNeywP/2+R+Qnjk75MGjzi1XnVBj2uHMLlXBiRJQHoLbP
         Hwu57HjYugJtxC2d12ZuqY69a6SfaCQo1VunzsGPrztAUySRLYd0ssA06f3HwLbgyojI
         rArryxXudlvNXMW2jQynddLB2mUJPR/2uQSN+CGnGxyz6TvPo5bnosM5hAZEfVGC61gX
         omU3Nhv98qwnAJtwidT0FwdoXZ0TqBca/pLLDwMW45dmN5s1sR68TFzBuS4JoFDsGzrL
         050zJdp4cPT13Rld2ObEXRu6mIs850ZtmSR6dx23N5NTrCpYttyndiQw/NVqn92YAsJe
         c1Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwe66WAwJ+zUOwRyxCpFx+FKBSapDCDVu7L+iI7uqIA3cRtUSgo4C0S+8lnaHFSFQwdI+NYNrPSVIS8jmG6r0Ui@lists.infradead.org
X-Gm-Message-State: AFq9FYI0xs8llSIR8aD/YdWBbSaVXTKpazrAqBt15A6YFIht6OmvuAFC
	pbxBLaX82wFLcCRRm7C6xQkb6laWK19p1gHFUv0eZL1OMTdSnuSI0VxXpThjiEQbyogqzP3W9/j
	OOHwUR1c+DnXBro8hmSYq+56M2lpcvmj8JXrWsQ4=
X-Gm-Gg: AYBFou3fpPvFdXyCm4Il/XmxmfDzuXQ2qVPBZOXZmB+WNXd+0OMPiHkz3HKXEnVU313
	TTlkMtRJdyHIM5pZA/blsKuZUYE9PlgjYgl2OuvJabByTisQ/Z7dpmqvcVFoIfanvjqLi50sgcT
	qRAYISB3mwlb4ovlhX5niZu5l+RunJMAs6LjFSiVZoszM4UuUtBlmsd3OXA+fjE138enoNIao/z
	+uW1rP9tvVxkLCSGJafNHdK12+p6uSH87OxWlZOHAHchHMfECz2u+PaQ2XTI7x6b7CqIXbDJA1u
	8q2jQM3en//T9uXvaDcaM0quVMeQNNDXCOlAAzN6NkZGdVct2FwFZMI=
X-Received: by 2002:a05:6870:b3c9:b0:470:e96b:43e2 with SMTP id
 586e51a60fabf-4a2a8a006damr5468714fac.14.1791768693370; Sun, 11 Oct 2026
 18:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787667315.git.ukleinek@kernel.org>
In-Reply-To: <cover.1787667315.git.ukleinek@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:31:22 -0500
X-Gm-Features: AclHuK9zZWuXjCE2LSWgrYCxLXd-j7PFIMqmTq5GuyJPV1RCzAMsJ-tdOzTsoNU
Message-ID: <CABb+yY2Sz4cH-uG4RYsk3DveG6m9OSV_4PQWj-8R1zwUC6PeOA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] mailbox: rockchip: Some cleanups
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_183134_651428_9FA73427 
X-CRM114-Status: GOOD (  17.15  )
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

On Tue, Aug 25, 2026 at 9:19=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> while trying to understand how mailbox drivers work, I used the rockchip
> driver as a reference for a working driver. I didn't succeed yet (so
> it's unclear to me how the .send_data() callback can assume that data
> points to a struct rockchip_mbox_msg).
>
> This patch set is the result of picking up the patch opportunities I
> noticed while looking through the driver.
>
> Best regards
> Uwe
>
> Uwe Kleine-K=C3=B6nig (3):
>   mailbox: rockchip: Add a prefix for register defines
>   mailbox: rockchip: Simplify device variant handling
>   mailbox: rockchip: Convert to use dev_err_probe()
>
>  drivers/mailbox/rockchip-mailbox.c | 60 ++++++++++++++----------------
>  1 file changed, 27 insertions(+), 33 deletions(-)
>
>
> base-commit: a8406e6c0b793ce0788019683837c40855b55995
> --
> 2.55.0.11.g153666a7d9bb
>
Applied to mailbox/for-next

Thanks
Jassi

