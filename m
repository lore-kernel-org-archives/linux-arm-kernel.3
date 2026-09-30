Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEEACA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6F2ERHZWXw7WA/3EGNJE+vEhgczaBRrblyhbjUi05hs=; b=t8R27bQJPANiJQE37UnZjx2Vzz
	XOn6A1sxQKQ681z77EtmAQs0aBHHJjJCZCZBEhV1VvWzKftXkP0r02ah2KP6XwnZ1+L8iw3C8TIdJ
	wagO02yeSZEqzOCPUf2Bxh965NxK2kxLkblQ9kVDtKLM+AW7guR6oQxNR9y9jHYCdWVessdp610vQ
	mdE5rJ7a45Bt+VR6btWjdnMaJEhrkTt6jfkvNfUOJVd0hObwiO2444Ho4vqAI+H4GeN0YOq6EYDus
	DlwUFRBPriKy28gz8nccMB2bXoqBvy3ajbRovAjmCDIQRA+BXAhiSb+ACheZW8jplEI/TRRDhWiqn
	nooPK1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsxf-00000005x06-0nBI;
	Wed, 30 Sep 2026 11:58:59 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsxb-00000005wyP-2o38
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:58:58 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so792466466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790769533; cv=none;
        d=google.com; s=arc-20260327;
        b=fvM6n7dt+ZKaOLI9WEnAA94IU+FEHjdy7kKQX0RHdLwgiRCAt/N6mB2KqTlz7C7V4F
         8munIa71tHcJNxu7qOuZMkgEKrm24SgpwcnU1ZiEkDgvrAjmkIkLNgeq5aDltWl8mEZB
         sbzTFQPnbeaxC43z07q9Loz9BaWG0bLfGWthF7pEZuhhbLasbDJ9m+9EhE+EnpRcKzRd
         Q9gzwsGNkBfK4sj4YirEuMkYqD35P6lWaje9ZBnqZbF8VovWIOKjLa92WXJli3xWpX1O
         mYHYySaOfK7UYf0GZ+H4tZ2Fpf1Rmaj/zCF9yDAeDKzLnKJEbSJcxo89pIiAYN3VCcqr
         uR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6F2ERHZWXw7WA/3EGNJE+vEhgczaBRrblyhbjUi05hs=;
        fh=akvO5wDH9QUwrY+a77j1CMyxy40lin651vsEO8odyaE=;
        b=scKKspH6bnjMczfOTyI6rdtxCBFX3iiZehQDm+XihElfZ/7eaGbVdNcFZIE6Ci9ok1
         XJGz9mI/hxz+92m7aHs8BFPSnWam6yQLNfxTYATd9VLVYSDpEjDhmZTiSatgUruLr+w2
         tsB5GgMueR4pvHiY4OCDFAW28oLAJS5PwE9cqEcI0U/XXhCDFLtBAxsZsKYfpoWG0FXq
         J4SNUk0Vuj0IoevjgMDkkDdb1ZVlmk6Z8sCR0KTR5ZGD5MDGXWnaIEq+0QhiaX6gLypX
         tLID0dbIf5HuZ3upNP2m32hxajecERFaiZHzmbHnrSPKuml9BfivfmkyIbNx6f9YK9/1
         oQcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790769533; x=1791374333; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6F2ERHZWXw7WA/3EGNJE+vEhgczaBRrblyhbjUi05hs=;
        b=V5f2TVQGhK8ofvvfHIBlRzVSolpBjlZzIscUOoPPz0dBX3762msMxEM/qMTM4tNXSn
         lJeIjZeDqplKK1jI3OVbr3e4EBYXYFMpAnhgxWSaOZ5RaT4QrK0jj/9v8+E2Xai810eS
         JMs1Kf2Sn/Mkn2oTW/Fl1XqI5IN2kQDhez/DvLJsE7EyNXFWhKDN4PfNI/u6jitlgRov
         L2oJ1VNlgjPLIsxtV9ZtviT4gok3YDhC93tvqzsGVh5UzuFN2nnkwZ9zvNoef1o9i4Gj
         3gf1oJRY+Ko/GELgyQlE5cqJ6Wq2JkSWwqC+JysX9ZyzFsl5rTjtgQetHoDOuJ4R5AeU
         j1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769533; x=1791374333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6F2ERHZWXw7WA/3EGNJE+vEhgczaBRrblyhbjUi05hs=;
        b=vYI6CO4mbhaec8pWT8ncVxGAqm/v4KRlHetFHUYWNwSefdc5vzLOI7mVbpzS61932R
         HcBIR/kByAzHrd8jMDuemoTWuEiM5xIbpVE+N/AHr16tKqS7YbygmjgN76NR6uPa9iKC
         L2Uoyvkf+HXzWdVwvpaesv5ryuGqHGnoN7dMHfusjg1yEqXG9633hwvxiVup1CQvAN2y
         vRJj2T1rC3+SjIxbvNhxwLjgzDMQ9C54Z+oBqfcYLJ0vrI9lLwohatxafuaJ5Ck68jvj
         dV4xwAYbGKQGLBYpC5KN939m3Pcmz8Bb5ScjksP9Bu0VaeoJr86i8yRrtMYVdcIOBrWj
         hGZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcpzIpTcbsyS/ku9XP1Ap7UTpL2NfJHmsP1g4r4WXnvMphANIeayfgX8K1DANf1uHExrv4xDwMKnq8CFX0p08V@lists.infradead.org
X-Gm-Message-State: AFuF++nAmyGE7M5chbGzf5TMg7YPC9WlzUKMxxKMPJyJXqaamRZgjNVX
	PqqKxLDQVjRXuVB7wr0X6h18GHjU4M6kM8U/sC0tuh+XUV511nvxlg490AD82IOfh0ClKr3s9uP
	K8dygalw1kuKtyCZ2onhND7/FQGpnSMQrt/vGXXLZlA==
X-Gm-Gg: AYBFou0Zb9MQyHsRrJHiyd9XmlVAqi717BQ6Rw/yLsNpVwrfYcsh1IzkXWbI0jwDfa9
	y/jGXbrPPexbzJ7JPlasiQsSSm5YYUXE31H1G6Nr47GNeRUZgihtWA3eX6yqL+PuH1B7iB84+Yf
	zw9Sj9nx/2WOBB/4kJ+GwaXszt3IMqv2pQC3gVS7tVIVQfUryJpER5MYv9dnCgDYcbn1nqldaq5
	pjnj6Be56z69mrK1jGgJlFkw4JFOoNt5bK+kqllARwbyWT/5jS/ExOlYMr+7A44oDix04OaLxbL
	d6rmdN/tVTuBYaiP97HuAny0APpQwzxgOX3g9zHg4Y+gwbd8aPCzAS9hutwG6NA7edr4vZqPYW7
	AdxSl8aKL2GaRlw==
X-Received: by 2002:a17:907:9708:b0:c26:19de:913a with SMTP id
 a640c23a62f3a-c2e23e58df9mr108073466b.45.1790769533085; Wed, 30 Sep 2026
 04:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
 <20260929-b4-rk3576-reboot-mode-v2-2-5a34ca72065a@flipper.net>
 <20260930-fascinating-cheetah-of-speed-7cccd0@quoll> <eb2d513b-3c7b-4298-932f-8e7cc8d9c08b@kernel.org>
In-Reply-To: <eb2d513b-3c7b-4298-932f-8e7cc8d9c08b@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 30 Sep 2026 15:58:45 +0400
X-Gm-Features: AclHuK9WjZS6N6YQrXd5XAL-P_3Z00CVqfe-4TuT9v8_bFTVQ6par63t-_u8TFM
Message-ID: <CAKTNdwHy41vh_Hp1zOnOtK-v7LvpvH0tgjP0MrMXdtZUqwubnQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: power: reset: syscon-reboot-mode:
 allow supplies
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Shawn Lin <shawn.lin@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_045855_830858_AA39D1DD 
X-CRM114-Status: GOOD (  29.45  )
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

On Wed, Sep 30, 2026 at 3:50=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 30/09/2026 13:47, Krzysztof Kozlowski wrote:
> > On Tue, Sep 29, 2026 at 02:28:19PM +0400, Alexey Charkov wrote:
> >> Whatever program that acts on a reboot mode runs before a full OS, so =
it
> >> may lack the capability to enable the regulators it depends on, and a
> >> reset that preserves the mode register generally leaves the regulators=
 as
> >> the previously running system left them.
> >>
> >> Allow a reboot mode node to name such supplies, so that they can be
> >> turned on while the mode is being requested.
> >>
> >> Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
> >
> > Again fake tag.
> >
> >> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >> ---
> >>  .../devicetree/bindings/power/reset/syscon-reboot-mode.yaml       | 8=
 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/power/reset/syscon-rebo=
ot-mode.yaml b/Documentation/devicetree/bindings/power/reset/syscon-reboot-=
mode.yaml
> >> index 79ffc78b23ea..5ed70c87269e 100644
> >> --- a/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode=
.yaml
> >> +++ b/Documentation/devicetree/bindings/power/reset/syscon-reboot-mode=
.yaml
> >> @@ -36,6 +36,14 @@ patternProperties:
> >>    "^mode-.*$":
> >>      maxItems: 1
> >>
> >> +  "^[a-z0-9]+(-[a-z0-9]+)*-supply$":
> >> +    description:
> >> +      Supply that has to be powered for whatever program acts on the =
mode.
> >> +      That could be a boot ROM with no access to regulators, and a wa=
rm reset
> >> +      leaves them as the previously running system left them and not =
necessarily
> >> +      what their expected out-of-reboot state is. Any supply describe=
d here is
> >> +      enabled when a mode is requested, and stays enabled.
> >
> > This looks like workaround for missing supply handling in actual
> > consumers. Fix your devices instead.
>
> Heh, I misread - you need to power this on? Then how does your board
> powers itself in the first place? And how do you even solve the
> incorrect - e.g. too low - voltage on these regulators?

When the PMIC comes out of a cold reset it has all the needed rails
enabled by its power-on default state, which the DDR trainer relies
on. But the OS will normally disable the rails it knows it doesn't use
itself, so a _warm_ reset which keeps the boot mode argument live and
keeps the PMIC running would leave those rails disabled, unless the OS
put them back as it found them.

So to make warm resets work one would have to either ignore unused
regulators in the OS to keep it from powering them down (ugly), or
mark them "always-on" in DT (also ugly), or state that they are needed
for the reboot mode feature, as done here (which is least ugly IMO).

The DDR trainer unfortunately cannot access the PMIC at all, so it
won't be able to enable the supplies it needs.

Best regards,
Alexey

