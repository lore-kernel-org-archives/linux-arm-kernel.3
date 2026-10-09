Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2481CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 20:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZstjgpPw37lwOmQxNVbD7gUthkSfwTkdvZxCusc7QU=; b=eOuDFmGfjJUo4JRNbNlPW3BWl+
	cSBvRuG1Oh4q1znyEHU8HYWMBJ8JpqwTrPSHtFiWOMcRmnBxrCuo6aVcVkQSZdarOB0Qeoc9tLG6Q
	0CSt+lte0jtVkcpoTsH1WChYSZFRWYVuScQoGHB6/f3RWQKBe517hufYsG7pTEOWKzgKog99k1c3K
	9qOpa3d3q/AN7a7PNdJGMRtm8cTQxYiX76d8b0g6qZ4cJVS7PGg7ere33gYZ4zv2horBMmoYa/WA1
	rAbTXNU+BJIOtud5bUmaX1iS894k2zAnNeZKLKctfC8kcmojPME1Mysb4YjfgOoe7C6wNtmnsGYLR
	YMU+VAnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFH1A-000000079I3-15AC;
	Fri, 09 Oct 2026 20:16:37 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFH17-000000079He-0iRW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 20:16:34 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8ac525c1f05so545357b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 13:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791576991; cv=none;
        d=google.com; s=arc-20260327;
        b=EfJmrd8cBdxsS1aM1tLQXM5iV6f0cy63WNlvDnZ1vwWHNcSHXrBLNfwjHBCbE4c5Ga
         wHWW0X10kAlLyk/TRYajTjAeXjg4gaX+KfDg3cHd4OYbqpG4Mmm3Qeu8GaA5hxCpm2eM
         zPDZ2f2WJo5bnc13s6ZLU8Lz61LCXZhzvEMYQSiyzjP13ikhQhH7yUfLzgzvqs4cnN5y
         kq4GrT0JZtzhoVif69O6SOqqYCVxdjjvTUWGdGDlOLDxG2KBVLJwsKqwGPa4lT1IHYJ4
         TlpPKm4Gxp36MSEECOyIN/kvVBouNn9RBl3YrbvtI8c8b7JDI7hw2WiIUvbuYgFNsSqe
         NkZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9ZstjgpPw37lwOmQxNVbD7gUthkSfwTkdvZxCusc7QU=;
        fh=IytyPBa88WzyYdlObNV/5YP53AbF6oaPoBOuNPR0K+8=;
        b=cAqCfH+LT+5l0VIA/O2JirJMnGVC6w9IujmSDhVxN4ZSebjvgEjSaPatQsmQYe6N+P
         VOXD9cZQzcNqX2tRlvHDueqCwt4xLkaqrrGzdHcmABkrUZgFF+w3PvwGC7se3vrbkCR1
         oFtjU+DPGmFNnhL8xv6qvlMYaPmmrBod2ZtYd4d0WkhF0pZ6/l1Q+ni5oCuuCMjxxguL
         iL3vvlkFdMy7eUUWJPFXafPh8+wdA40CL08ZMJj2oGN4rEzQqY2DlPbtxOirH82CYlJT
         WjK4dYAFIl5f0Kbe5o5Y0uNxXQRGfXLvN0N3AEJy+iAQ3a/SxyyF8pODDPDYsR2TGyyB
         m6aw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1791576991; x=1792181791; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ZstjgpPw37lwOmQxNVbD7gUthkSfwTkdvZxCusc7QU=;
        b=TanR58O9sMgNZsdkwr8E1b4S94kWYVhYCIZhvNwWQrgsJ3Qsu8tGaFK9/WfTizLjL5
         SS2y3JZkrb2KDT/WEcvxMQbjr9zn9xu9Is2+92JNyFjlC9TE89foBrbz08sUk5FYjcoM
         wmUtRTvN6pktshdU6ngEyRZjoRzU3ltCXs+UbWRhZUvRHS9ZxoKcWL9+RMg/SvqS0pQv
         qJDh0+vE60jL9hX48NHWivwjW9hsufq1E0XO6NNWQzC25yf6k9bkpHEVooFzAYD8zJry
         4CZ0DmhCYyg2bws7P5tgOmg81X7qCxtYZ9SYLVqCl7ON0C7UA9ch51sfaghH4JiKzxws
         eKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791576991; x=1792181791;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZstjgpPw37lwOmQxNVbD7gUthkSfwTkdvZxCusc7QU=;
        b=YDDz2wKo110LbNtBejw2Fz9zF8LwF3tSawuiaHpsr9etCx/p+8h8gPugSS8AZzI4Q3
         h7CGL15AG09nDhm2T49sMxrfNH9gh6c6zUrgp+IOCV4l2VQndP4uMvoRMSXq0eBKra8i
         47EmLBWBp3X1h80sYlWYZ4z2Bb1zl8t6p1Eklczvn9n+Spyd1l1NNX8KEi6Z9ndqyZqC
         1bD7+12D52ref4bUGe4rxNWQFU+3Bo7zf7SWmejs62CqHwJ4lja153aSn0AyF78YFO0X
         Ythki+ROD0AnGQ7A0WGkxmrneF+tMqg23U21eaF2zhdvlR21jCLOjn5bazTU6/mi3M46
         Fg1w==
X-Forwarded-Encrypted: i=1; AKwUvBydljfmr7XknXG0wyWovOxbTSJV+wN0BxjVs3IHg4TlYTaqhlAXdh3eJ+Z/bhxlzlBSXxpcGOUrUyKFTdnj4TEo@lists.infradead.org
X-Gm-Message-State: AFq9FYIar6SU0YiHC7+X4u2lZrsCuhcv3Z2390wdUbLI0Xb+B65ySLrJ
	3uUltj8knx7uUClEBx4f/jGkDogc9I8K4ZT4pgYZBVUqyv7PBXguQZ21nZe+1oRb0Yv9OZ/fatm
	2/B4R7NyPTG1oDdFyqmn+DCa4DYqpi7+DQnQJSnKEY4Bzcoces0D37aA=
X-Gm-Gg: AYBFou3bR7RBe6vTkUkOCDZDvRD8XVWYuXGnNeJ7cnwA66NCZR7fYGJKbs+LLocdC48
	fr3gXkLkDynfFOIHmWPTAEkIOa+hLjQm/I5ghY1AxsSJZhY64jPOGcFWxYJ/xnKfnrPt9mFqRFk
	6M5BqnID/MNIOrSKCtkL3e+H8IorCx5GkTx61cPQOo8FotF5Wj3GBLLvk007QJSGzf3kyFyJABV
	YZAZsVVEMVQ/gUfbhZ8NeUWX+pNrzGOlQ6KhR8DpVtXJORNFL/m4HPwN7/+e+QubE5qIbMcTdnr
	wysyvrp+vGCZFDJGUMdPVlm7KG/ZJbbgvOGRoKAHEgvk2+902Ad6QhU=
X-Received: by 2002:a05:690c:7483:b0:8af:5430:23f3 with SMTP id
 00721157ae682-8b07edcf030mr14065407b3.19.1791576991277; Fri, 09 Oct 2026
 13:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261008-i2c-xiic-block-read-nack-v2-1-76735ed0b0bf@nexthop.ai> <20261009145800.rc-reply-0001@kernel.org>
In-Reply-To: <20261009145800.rc-reply-0001@kernel.org>
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Fri, 9 Oct 2026 13:16:18 -0700
X-Gm-Features: AclHuK8NoU9nFQdsnoGWTbzltxdeCAjZZJguqpmO0Y-nucjuamlvwsTRrY9h3TM
Message-ID: <CAGYn4vzAM2RVv3y5qW1C3P50qYN5J7UKmj-LsMDv9EdqrX=G6Q@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "i2c: xiic: defer RX_FULL until all trailing
 bytes are in FIFO"
To: Sasha Levin <sashal@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Siddarth Chilukuri <siddarth@nexthop.ai>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_131633_255020_D2E2A262 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

Hi Sasha,

Thanks for handling this.

Best,
Abdurrahman

On Fri, Oct 9, 2026 at 12:01=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> > This reverts commit e6fe3ea04f0113fe4d47c03d76e03805a4768ca7.
>
> Thanks for the report. I've dropped e6fe3ea04f01 from the 7.2, 6.18, 6.12
> and 6.6 stable queues.
>
> --
> Thanks,
> Sasha

