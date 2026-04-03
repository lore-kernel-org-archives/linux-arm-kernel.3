Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A05FE85379
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=; b=G3mOfWYj5iRnY8xFkrHV3fSVBD
	Xtvoepo8fWRHcdoCEVEvSvUGWrdkpHSL9Wu3ydgXfjjbXM1CSSgiVPDQvuRkrjA2YdtD9YmNyld8N
	roM2awqoLNs1R0BxnN4FoHHTaxR5VGe++ncchvou8e/9lvxB5k9P5oUTziXvy0LuD8NsT0iDZP1Yu
	nG3eoCUHSpzpIqJHovI16hDAmWtW9sV3fFfLGC04KHoyS2BkgKhyyuwDEq/EM5VGRKM/dN1xNsZl+
	ZXbv+8P52viqCFnNfskcUD260gfy39muclyUaBGIQx2/+Jz8Fb8Os48DlbEngvbHoj56iCwbB3r7W
	UPecP2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hVr-00000002Kse-2DsV;
	Fri, 03 Apr 2026 16:36:51 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hVo-00000002Krv-0iaO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 16:36:49 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7d743cd9e5bso1347459a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 09:36:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775234207; cv=none;
        d=google.com; s=arc-20240605;
        b=ba6qEXvhlFuP+nWPTClR8Oefm7nEPBLuD3X6tJoNU1m3cMckq+V5rG5QxM+scqEM0J
         ZF/KVw9zoB7vsGXK5bL2/0LKC0SYdE6BMJlsVfQPdmdmdab2GFF5SQiNKD/OQj9rCYCE
         Ytdg5ZUb9mGX2Ivs6tX2MApZU/Oio9SIE00xN6ZOaTRRbv11K7/jviJS+upkMosovEg6
         Mt18G13+N5IDlKkvOFUhLULgUDxPBf+42NCUA9HQUEcmbmieTBzo47Sg/GJ2EFiwT+f8
         YAMJTeXmXjtoC5YWZAwy7N6L7ASt15C7kqXo723I5Sz0bPVZ4kkNejt7JT1g+7CDMVkl
         ciZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=;
        fh=OD94rFEgIyp5CftD+eFu7ng3IciV6pfbqGgE3pFp9w8=;
        b=MT1FxLmeb70kCJw8pOSzeLxFIR/MiJ3YsWamnZbUlSJzGhQpw2tukNviecOZOnUecR
         Kqjo01aTHz9pV0VO/9bO0n5AZ88x0bavryc+8bbjASVzQ37Ci1K8l5SjnBCtoYscGVLf
         cjbR+vCI9/+wnvVkgxoPFL9Diu6KCt565/9XbRn5QYJk5mRYMN3l5sluRILRAMQcWw2E
         QIbmhjb8F1ox+ZpgdWpEZZYkQvy4dKQhVExe7ZDleNg8mJiB08GNDuUZGcEFAEPi8eVR
         oNnHF3Iq2JDqzOKmiii2lxfFiM64IhVgyMQb6TUWsyA38oRFLIqEor070aYReH/HyxT/
         tchg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775234207; x=1775839007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=;
        b=XLdl2qyYiMz5o8Te0YlDSM9HT1iWepWosnjyWAsBe7K8os1rVREPeb/fRZ8EUlWUZ6
         xogr2FjM/XoS9ug5FG56UgF5b7KUZsT0rVFy3k4fw+6ngOkOCuO1ap3tkBKieagWvQYK
         As2ki2Jkyu913cAjdupIE4sLCbDNlCWViKxsWrdgSzV8+zaRslkeZmWCbJcT0Tds9hJ4
         ydmAk0WHqnJhVr+A90em3NvQEXAQ5VxGrzmluK4s4Nv6EZYcL/lGzu02+idfVD3dI7ta
         stkq47nGPOaIsmXLbvJ0MHuUhDvA9K3MOPxKm57Uu462oSY62PvaK+lBfhUtYbnv8GQz
         2D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234207; x=1775839007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhIYPi+ZTj650hQKyeIbVrsNYbY3op5BHueN/8Cl9Xs=;
        b=kBttKlh/8f7+2BMtJyIdWrVsiMkGxHQrRGfV4CqFK7eE4FZazgYsJb2pX778UTfHrA
         hqHfCwrhkOJ+BjdpBSLEbGLypydlhGhuckgIqRaQFZPaJVcB6ar5F0ql17FxZyu7Qzki
         4WbJ1RF/TjkSxQ0a/CZ6Rdw/ZQEq5hx85wEMqNhsLyRcSF0qWWOHjIzdYgXBm5l3pNmy
         BQa6vSO9aKYv7vIlfJ9SSaSq6fRlB4ayiYE1ZFPUjrLJfFwGlQkpjMPyiZHqrsRhQH76
         fj4mTBMYeL6nBoIrB8oV8EVGLY0DlNbPbfKJh9M2+CuFBdX73WwjrkCrTa2FSOuaypyi
         s9lg==
X-Forwarded-Encrypted: i=1; AJvYcCUdzVbzO5JKfbYvFO4+F34IY9AkMAINCnhf3fbW9mD7cMV2Ilu39JxF1R+cRy6MFxBwb6SP5EYYB0X4s5s16qT9@lists.infradead.org
X-Gm-Message-State: AOJu0YxRwyD6MTM7/4g1Iwr3sU7b9wd3gJDSb0rZrQ7lj305ktG/VPT+
	lIIGfSRZu1vLXwaFXMslQNUBvxxWBm2ezK4Qf09M0Q690gvQCY+t35GzW2SD79NUny5Gn/czNGd
	7GpJEqjI7fmkP/i9nFMDqJsOg+szNtYM=
X-Gm-Gg: ATEYQzyQLA4r+Lrj6dNdsjkBD0gUm9gzra3pRySSOC28KTuv7NQp1SzkTbFAZfp02xW
	8xo3LwUPR3O0ucHUE7lBzk+RSnBLi77IEklECNF6pmdDE4dWAGgO98UuU/ms3OtpkHYwkCIIPa7
	EMxwG5+NthosVh2LqGY111uopGElLuwRXjHYdk/3Q5SypqO+5/xzlyj/WodUnNKmMCdQdycoEYI
	v7TyOIX8geVJEsNo1afRGaSsri2Hs9gvNfF2OaIZeKsKLJK00q2MbF6dRnURug5ft8qukirhFnv
	AMfoRLTY
X-Received: by 2002:a05:6820:f023:b0:67e:1259:aac4 with SMTP id
 006d021491bc7-6821d747f8bmr1924347eaf.26.1775234206887; Fri, 03 Apr 2026
 09:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <CABb+yY3hYcJ82QGor3w5KKHUGz9Pc1k64Jdf-94E4Yvv0DTeyQ@mail.gmail.com>
 <20260403151950.2592581-1-joonwonkang@google.com>
In-Reply-To: <20260403151950.2592581-1-joonwonkang@google.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 3 Apr 2026 11:36:34 -0500
X-Gm-Features: AQROBzCNnfUiQJss0MRPovDqMc4MnIhdZ3NJ2hHQRVK29Ar7Ti2BAIx3xKRl0IM
Message-ID: <CABb+yY23aTXeXu6G-8sHjw32DCqmhsJLu2Mt-txenOgTBiyv+A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error
 code when tx fails
To: Joonwon Kang <joonwonkang@google.com>
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	matthias.bgg@gmail.com, stable@vger.kernel.org, thierry.reding@gmail.com, 
	akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_093648_220575_2725C9F1 
X-CRM114-Status: GOOD (  27.56  )
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

On Fri, Apr 3, 2026 at 10:19=E2=80=AFAM Joonwon Kang <joonwonkang@google.co=
m> wrote:
>
> > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@googl=
e.com> wrote:
> > >
> > > When the mailbox controller failed transmitting message, the error co=
de
> > > was only passed to the client's tx done handler and not to
> > > mbox_send_message(). For this reason, the function could return a fal=
se
> > > success. This commit resolves the issue by introducing the tx status =
and
> > > checking it before mbox_send_message() returns.
> > >
> > Can you please share the scenario when this becomes necessary? This
> > can potentially change the ground underneath some clients, so we have
> > to be sure this is really useful.
>
> I would say the problem here is generic enough to apply to all the cases =
where
> the send result needs to be checked. Since the return value of the send A=
PI is
> not the real send result, any users who believe that this blocking send A=
PI
> will return the real send result could fall for that. For example, users =
may
> think the send was successful even though it was not actually. I believe =
it is
> uncommon that users have to register a callback solely to get the send re=
sult
> even though they are using the blocking send API already. Also, I guess t=
here
> is no special reason why only the mailbox send API should work this way a=
mong
> other typical blocking send APIs. For these reasons, this patch makes the=
 send
> API return the real send result. This way, users will not need to registe=
r the
> redundant callback and I think the return value will align with their com=
mon
> expectation.
>
Clients submit a message into the Mailbox subsystem to be sent out to
the remote side which can happen immediately or later.
If submission fails, clients get immediately notified. If transmission
fails (which is now internal to the subsystem) it is reported to the
client by a callback.
If the API was called mbox_submit_message (which it actually is)
instead of mbox_send_message, there would be no confusion.
We can argue how good/bad the current implementation is, but the fact
is that it is here. And I am reluctant to cause churn without good
reason.
Again, as I said, any, _legal_, setup scenario will help me come over
my reluctance.

Thanks
Jassi

