Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A6BC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 20:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdqbJq/msOBCkkDUN/S0Xt6oyVT9dXF1dmGv+lvM+gQ=; b=vL3Jefp3e5IXLdjBtzNYsPBwlh
	dSnjSKu1V7VdNmlEakwGGj9HjPUmMRRPsK3RC2srj4V2n1pWkFarlIMAHBAJcF2oFpyYWz5oGYQXh
	UrvixxbTHOoTtX8TMHLJJNwQ9GjGZURgV1w+XoOy0DSv13SluHE0C0pPERxux7TP502AMkNcnpSrx
	mP2Vt0dcVJi3JuFkwpBEVhTJFdkonv/siyN6ts+a+81LTIxrb+ED1xXvLD40yQ9Dwe2OyT/pgxrgN
	OQ+w5SD741677myXwpY2OrrYY6JvGNTDQzzODMuSiraDz8UMfkM+v6kOJ9ShhIAb+jYRyM0EupNMh
	JsNld/Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybKH-0000000HMw0-1Gbb;
	Mon, 24 Aug 2026 20:31:25 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybKC-0000000HMv6-0XH8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 20:31:24 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so7831489a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 13:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787603478; cv=none;
        d=google.com; s=arc-20260327;
        b=FwOfARP/In7ayUnCQHj4T9TmkWdFfRcOuC+XwDAFL198BDAyAc5uynnh5393IZq9Bu
         hDQQS1uIgQ2OZiiH0IZf19rciXYwU7SUSjtJ+Vc3pYZVYxk+MNI+0uDNZySgtNN3zkJU
         kLN+21Sf7C0JSuGxhN91MECh7imD6lRoLt6IPMcdcWKZHLuc1YRhyoKfZsvGATG07Ktf
         /bEqzHy+sn8vwVJiVdcT5I1necKvRnELL5tNkMiczOuSabH2yu47kIM9oqTt+t3Q9KXZ
         8qvnd34x/RnU0J/VPdPFazmg73yPNCKkoiVYiWpFnF4W2fQ7OTEsYM9joXTivdWN4+eV
         rzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BdqbJq/msOBCkkDUN/S0Xt6oyVT9dXF1dmGv+lvM+gQ=;
        fh=JNfE3tAzCAsKLJyT5n7q0Pz3lHLTA18ENsQWSTFT8b0=;
        b=ThBU0GisNtonQn1ESY+6qozY8BA/rIUJCTnQjazZcjrrwjvhC4NK/KQBzymv8/FngR
         MO7jXLU3bD11VL3BrC91AEhz04SilljpcklMhyWDojwaA7yMQVu0sx92RduydSgGzvrf
         b2fO6b2iQxO5KEfTxMPLvMnMJvcue2mpyYmPwH9UYmvqSfT6oMx9GWYAXUcXpHXd80ZT
         49JY1ceP4ZKEEsFEduq+ntOsTSRb4wjL8fu+Koeh4JUUhiEnu/eeRxutKscuFvsLEDKW
         PxRrjY5tfkOFOpUO5Q2JZ78xHM60rJBEk/jjSfEOtUzebuqpbqbqAJ5oUuVMr1kAuQeW
         CTcg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787603478; x=1788208278; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BdqbJq/msOBCkkDUN/S0Xt6oyVT9dXF1dmGv+lvM+gQ=;
        b=RCmhgyINnxXXpW8OGlCJWsW8xjHeJuKHJ08D+luVvNDORyec5QHrqPP17cKYd46jkb
         mIiWiXJjBEKrBTYNS62UHgNKetpG58ebdtAYRa8wJn9ej85/u7rE35CXdoptBBQHdXJn
         lNf408pagbCR+AXoTHS4M3NI6lRzURULpjo9W8Wi6TQGZOjRTRX6zJHH8Qmh3Sol1zR+
         sR3SxjaTy05JV1cmONVl3RMMxdn0sos13aCiA/z6/FZz49NPsTJxx89DzfDaV5K06NZh
         nw0IStTVsgKRNgltvqJgD8AHHz9C+2y4B8HCvh7WuRo23aAX2vrv7NgYS0UZWMEG2WfR
         i+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603478; x=1788208278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdqbJq/msOBCkkDUN/S0Xt6oyVT9dXF1dmGv+lvM+gQ=;
        b=ocAhauTCjzZoOys/DTAJTP+0CHVak5Ar2n6/qGyMuln1dPWpNyhtThGaCXEzyNN1Ir
         WGgvQc4iMJFif/+CtQFvMYp+DrXfmQRy8rFZqWpMem6yZTvZZrC5P7y0OoIG9uHaSXRP
         tHRb0REQPW4bCjncDvfL/9Ad1txhtBVJ9QhdDDUsqUhoYXhnSbJQtLRrzTtnCMfL+7d+
         ZSm+aqUXhb8AjfCg/frN1DNk2xya99f6ZXHj5KpvI/PtW9NcPLGGtVgMItCpwtejOvMh
         XX1c6gpHlren/ugT9437HQMSSt2r012RpAImGPqoownUMPxZFmxU6poMmcpNcW7xz+98
         rkJA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Ln2m0nqsy9U8dnGJS/EKS82T1lohQ6/wAPpLH3+QTmtkuaLAPjzW7PeDubJ/9jQQQdLLJtTdmHr/dmMYoCqW@lists.infradead.org
X-Gm-Message-State: AFuF++kX2MSoYANTV6hM1hSFwmRWnVa92De/3NaL6cAhVZ2ZMA9yQIdp
	a/MF5Sm12Kn0cYPn+YE8dZsYiz4nWnJz03QupHghFEfRFtCAlXjf8CRTt2i7n+k/Az+GxnKnN+N
	0e0NeUpw5Eog9jyZ8pVFwqXUMpGd5p8M=
X-Gm-Gg: AR+sD1338z6JoU86gCZ8EfMyOCCsF5pmrz1ZaCliqzwJ980vHNazM2B5obECtgnRw9i
	ojIkts2iksoeb/PUwzSFmA463CAyIHvuLqJ8Ecwxxqo4u8UcvqtmBeVtZyAEGA7ShiFc+XvNvcx
	aVLwBcUdn0XkPTGXZstMl9Gonl8v9JjxrSM2Qh/SYF9WVLrwEGo1h8/WNw1ZAH2usJ4+U9nqOQR
	vODh3h/GtT5d7Cduv0H6AZ4rwHsuoAxRfbJsKSRAw4dWgdMw/wihU4cisMuT0u+i6QuEM39cMo9
	DnlAt1SQywh4QmiEAaHEu9JhisueleOTZ2lXXo4EO7hr5pad2wi5rA6QQEv08mlHosxkH87xaMd
	5gIEFbkNmT0gTGWVTLsa8c8gGPiYPravY1OCz4NJQqmevn74oa3Kz/21qllMgKT9Shm0f8wDQyJ
	lYCVtl2os2CSLXMWMmNn80YZJsrTvzD9Z0m1m41DRN9NIyYsydNZP7cC4w
X-Received: by 2002:a05:6402:1906:b0:6a1:f8ad:6c0c with SMTP id
 4fb4d7f45d1cf-6a42f1fce20mr35518310a12.16.1787603478279; Mon, 24 Aug 2026
 13:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260823050012.17067-1-rosenp@gmail.com> <219e4bf6-f7c2-4651-b032-e9b1ea11feab@sirena.org.uk>
In-Reply-To: <219e4bf6-f7c2-4651-b032-e9b1ea11feab@sirena.org.uk>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 24 Aug 2026 13:31:07 -0700
X-Gm-Features: AcwNN1Xu99UHBB5ytUNfFVDP-9LDqFJzbdzdqQIBKkcj-I4Wbr-XxYcud_LSSAE
Message-ID: <CAKxU2N_Jt2kfV0mpLTa7s8sEYBgk=2L8_SvdRPWjgf-_QMtEnA@mail.gmail.com>
Subject: Re: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Michal Simek <michal.simek@amd.com>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_133121_054761_F7846B6A 
X-CRM114-Status: GOOD (  12.00  )
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

On Mon, Aug 24, 2026 at 4:41=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Sat, Aug 22, 2026 at 10:00:12PM -0700, Rosen Penev wrote:
> > Use devm_clk_get_enabled() to let the clock be enabled automatically
> > and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> > clk_disable_unprepare() calls in probe and remove. As a result, move th=
e
> > clk struct member into probe, which is the only place it's used.
>
> This doesn't apply against current code, please check and resend.
I resent a version that I checked against master as well as linux-next.

