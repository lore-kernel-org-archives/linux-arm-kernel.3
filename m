Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2EFCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 00:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5F4HpHZPdS7RM8VbkQ1+0+NF4PdjhH21V3y/145Cyk=; b=OAMdFAz7B7+gK2AkuChO3sqUrJ
	3N93tfkXOGRBjYqG9HtEniN3ehzQ2tbguYPGqK/xDtXx7FFN+ls2eBClOyHSBCNoL/pbrglBHDry2
	Tadt12pnR+lY1GK6MNtvvPGpsCDdkR+rXvn2n/UAZ1w16PDAKUQFczhFBDDstSmox3WXylSrbevAy
	VHFaG42jeIY28v16lvpPaq18ev/aQ+r6u39Vvw3xfX8q67Bek3fBovGhn+0lE2M6w/Ec9e38NZPZ2
	448aBo8yh/wC95VxEX8zFWQvMU6udMSh+TOoSOJZf4Vs06ddeEyCXyr8X5x6RljOUJca6TJZv7lPX
	NFloieeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPrjn-00000006K3d-0xLx;
	Thu, 21 May 2026 00:58:11 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPrjl-00000006K2u-02l9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 00:58:10 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-7c5d8f45465so52650787b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 17:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779325088; cv=none;
        d=google.com; s=arc-20240605;
        b=kKB9dYbg1wfNouebFWZnGi8LEFX5c6zGncqOb9KyRHxgShZDMnZfm44skOVkYeLHZw
         90un895wTcZRDTKAYn7h41SnI+WTqxsGI3BhVSKktXA7RoDK74I09CVLBbGf0McJ9QDo
         lRAdgnlquVYd2c882lO7gsXr9yPcP66hswM75m5cHfU47Ifa0dwDbD92TY7fSTD8igup
         6lPxNJzK2SIuU5yqc5i2aG9QtVIrfzcp1iU9UrGQi7n0u+jvTKAR+X8jw775SfNo/Tkh
         f62mnMH4z/awts0F0M5DbqxprUmemtlPU+1kGralPp+xt2jzAyOFdIYredEngzFUH30R
         fknw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W5F4HpHZPdS7RM8VbkQ1+0+NF4PdjhH21V3y/145Cyk=;
        fh=ogWxbjGIsDxXyVBVGK2x/6hOdpI/Q7NM0/OBCD0PApU=;
        b=bTJqKVUh1n10gJ82NOudhM3SSrvCzhfYNGUg8Iin2HPxYUJHx6BXPpEJUpsT3+m8gS
         dC0R+pZ12ewnYxYb/L9p0XoILLHTlhBRzbJwzZzXu+sf8alxJx7Ueuuad7yqwxKeshi9
         hN6pte/8/z2Lb7dwhtEyAizznNEcv+tZETuH5ZJsgHmB35o0fL/Fnn9ywRodkUckBFpK
         KgrSWTLXx1sx+xoeZud0YT18FlSUQBjgDjcGiXv6rSoqgYgtpiL5FRMOti0YqRIODz9n
         rkPyHGqHGR83XK34QQq3EIx3ldusjzm0uB4F64zp6ZJB6wwWmN0AkfPaKm+RgTTVZ2h3
         rL2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779325088; x=1779929888; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5F4HpHZPdS7RM8VbkQ1+0+NF4PdjhH21V3y/145Cyk=;
        b=U7ieBbaNTacXEgSIAr6dnNR7Y/DDkZ+gLucGkWLO3tLc56jaAe1QkL0VtRjUKWcMiU
         wC4qFmMNgJDVwFbOMrZ9aowx0iVqb0Xi4I4gUrd81bEuUEr/i/rP4cp6iTXpABOnyDp3
         DeZLaHkYMlsO3+fKru0WFSpfSGJog/y2Pv3oEtYJ5diXQI8hiEhXzXRthxdTUiNX6ZrE
         EQ/Fv+ANmDaUrRvBVeH4CsQ3aBQ3zy2PcjQpVir4ReHJ7XW2W8dHK9AvXxpynaG4kOV5
         TKYWcR6cRFfqnsCdlGibW+VZ3EwfiE0Rd6DFy1cYpaI4ndOIhciwWblP4qKclIGtsona
         cV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325088; x=1779929888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W5F4HpHZPdS7RM8VbkQ1+0+NF4PdjhH21V3y/145Cyk=;
        b=rS5pee0MApF42ImDUEIj5LolQU3uAUxkMguEvzd1W5nnFPyWj9t3rMn+j3N52e5rsK
         2Y3aCfn5N9eDTIkckKArc76j21pKxruoAN6aLnwfeg9lzXQk8bGJBiAzb16zOo+pVnOx
         eE3MulfxWByWzt2oeQf383intN4mA6oHnGxh2sEHrUA5psr0HjKWlEir4tSiKtLTFluw
         ZZJtO5lqpMJAZJVf4hdEHc4B5uqJl2TrJlt5J8I5boYIKc0Udf2Tk5oJcEb3pWAJy1Ge
         Bu/WzM/Y6DivQuiFpQ8rNwQQmVg0OhWyRBmITEHtnn5++FrHr+xWeVsjfHLQidJntpSB
         zJZw==
X-Forwarded-Encrypted: i=1; AFNElJ+Z1p23RMg4VHaBPL3wQtuXAzZf7RJjmxeKgx92h1plTGAyOn+UjialsX3iXid+D9bLgvIV6RjTe1YNISbKbWo1@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1UHqMyArVNgM0ZhFJO6KJpZXZ+8KncvSdyAK0UXsS6mBfVFIU
	TQ4NX66m+PccArVOegMsk+3dJ1ZnpK2l1ol/6dgQIpam8ec0/RW3UQiNJRtDipvL1883fbpfkEq
	DxpsXE5F4oovh166s/sF2whtw+cgdM0E=
X-Gm-Gg: Acq92OFIDSQ1RSTCmqmTZf+oyMpKVcE7ec66QVtPNLeBugxkMiVRAebpA0AtTjnhNKf
	79534swQ0ktex1g4HGUQpYYnBvpiMeddIIyK43ntLAC0QDulqx8+aA6tpO47KOATAunNeC84AvP
	G6kGTRlAb4Cv5pBEgiqQUNqZKgyRzZ0G8Cb/e3sjxRuuEchtLWqai/5fspZ0rS3wYzVnGLu23d4
	3Am2bm3WJPcAoSvdamx72ba3hwKuBTIOhYyIJ8kP4za5XdkFyMkTo0EU6/fsGHi8iW9DHniFU9Q
	dnKmPzCMUZmV3glMP8AejZIcuzb36NnUFOLr
X-Received: by 2002:a05:690c:620e:b0:7b1:fa45:72e3 with SMTP id
 00721157ae682-7d20aa9cabdmr8852397b3.4.1779325087719; Wed, 20 May 2026
 17:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260513181922.2075438-1-michael.bommarito@gmail.com> <67bd72ba-6dab-4bdb-a391-27545e287e94@collabora.com>
In-Reply-To: <67bd72ba-6dab-4bdb-a391-27545e287e94@collabora.com>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Wed, 20 May 2026 20:57:56 -0400
X-Gm-Features: AVHnY4LiZldEGrXYzyoGnIuTwsQ0SpJxkVwOBE92FWCPOBOhNuOGZvffXZndLp4
Message-ID: <CAJJ9bXxR5U=33RSzB5uFEZv3ZL2JE=UjK7ZToxm0ewSqyu5GBw@mail.gmail.com>
Subject: Re: [PATCH] media: rkvdec: hevc: cap EXT SPS RPS control counts
 before descriptor assembly
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_175809_053177_E39EA423 
X-CRM114-Status: GOOD (  13.21  )
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

On Tue, May 19, 2026 at 9:04=E2=80=AFAM Detlev Casanova
<detlev.casanova@collabora.com> wrote:
> Still, did you try just changing the cap to 64 (.cfg.dims =3D { 64 },) ?
> You'd need a test that sets the control from userspace though.
>
> It should refuse setting the control if there are more than 64 elements,
> therefore the hevc decoder will not run any function using the count
> values from the SPS (See  rkvdec-vdpu381-hevc.c:601)

Sure, I can test that and send a v2 for ST.  My understanding is that
we have four spots we need to check across the flow though:

1. ST count > 64
2. LT count > 32
3. num_negative_pics / num_positive_pics > 16
4. delta_idx_minus1 + 1 > i

So would you also want the same .cfg approach for the LT cap?

Thanks,
Mike

