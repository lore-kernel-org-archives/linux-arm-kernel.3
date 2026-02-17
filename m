Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B15E909DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=; b=0htcfvC2/SptJo0J9VPGLzd8I1
	si5Og1tDgdX0dxSoLf1VEUTgLQC+xWWmNkdspN2sgGU8ejTwJBo+gBnksZfjdDQJqKIYZ53HaIWwc
	H+KIwDsA8nMFC+5rGZgI9THqAYhTZTpaa0yuDUrhxrVFSExtAEaR5ApjBpNndFKGKqteeaEQQ3ei1
	BQH3mpcHk5SRza98jJyJEH4PZ28negqPKlmrkAjacCXsYpkrJ2x+9xFxM1mxP2xN6Pw6eDgxI2rml
	H/LsHKJvpCHz5VhLp9pwVYPI4zzX2mOGeSrVSMXEEf1S4MtwQMRzeKyQlvhhNL0nwRPeXzS0hCVMM
	2Jujsf6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOWR-00000008d9W-2Fi4;
	Tue, 17 Feb 2026 17:06:03 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOW6-00000008d7a-1XYF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:05:50 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so7466890a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771347940; cv=none;
        d=google.com; s=arc-20240605;
        b=YJT2ChZ+lCsACdrZA1d4qrJEpRUuokGmYSImBJEoLUFj+k9/Gd0Kos0fKvEkMBDpAq
         5IRZ1yyVtQD5O4RqN38Kaj/zIKkxm8e2DfzEsWcwJfqpoaxXyqyapxkTrTO7hLz5Kax2
         XzQT3kXohZqO2ZLKhpXbhumDlEIQzWNRt4W1MhnpATqwy9kt+IM2aJ0rLDs9aAuG2QKq
         13VyMNpqeWwscdjvLkaCSt+ZgdD/qttJsBc7CV+h4GwhraFRW2KU8N+LWHGRzuxRtg3r
         EcFIWg1jzo7LNNzMyUUvMr09trLoo8MQw42gp3vwYVzgnXKphzxvUaA3+6cN7xC/briT
         hehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=;
        fh=BhCGT6WhTd2V2FdYY9r2EH0UiRuL1+q4RMKsdytb240=;
        b=MtepgMoh6ZtbbQErjS678BaFsflgaU33hhY7dohZJ0azypAjX32dDYMso7dEkMJNOs
         NOZqFTomuLg8XdTxIyC/8n0vmdC1L7KzzyxrUjqGWP+kuxvRjqhKUlyTLtCSQFv9i/T4
         yvAtUQcHS0p60J4qB1d23FQBpiERPzAL/j6TyS5OOu3P9J7kM8HXiJvndth6UX+TpTJR
         drATL4ELHtJMCYp9+hzICYBhVeVkIWfxssP3ILRcE3QU9koSsd3fNwme3YsWo624Vdgf
         nbYyqFm6nxZiFtZWgz5NctmZvLI1SD4zYgA+WQ+Z02N7WyOm5Fl+dxX/WBfts5aG8Y2w
         thGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771347940; x=1771952740; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=;
        b=abGbMoK5Q8svfnm42sM+D/yHw6Ta1IFEd2LcOGdPjUugiweo+BDgHuq6RzlJXxsuaq
         HlqAqrLcpfHtgTW0L75cXDh6MhU4CRVFimy6lbK8RbN6gZbfcU+qDOksDzUl3LvdcpHc
         g/C60jSMfM5Oq+GBV3GJmneAh6hikQ2tdWEUlUSUix5/waloKiJ/1S9r0erhEzUtC5P7
         0KceBHK14z08Qx4fHaNYafaIFBwWkoLf7ANzJL50AMhLXCB/7AvKckiQLzo3tqV0/3CL
         7GoNtguYnypQGgo+cPjhHyVCsJs7Ar3YaGGzQsRQH/fyliNo/WaAM1i2+p8pC2ihETgs
         9aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771347940; x=1771952740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=;
        b=vvMnT3q2bB0k3Gx3XrstC7QC915YM+3hfW18aJZIfjRtuDdryA87FJ3O+Q0SwZlwP2
         +8EIlMTH9yt1hiuk0j7u2d1AnN5ytiny2XHVjSUUb0vZMh+i6tm1pGLj2FDGNIe1iEVN
         dzt/kItXTy8foJp4iVCU3aGg0SQHd7ikvpH8/rRflGjUQHGOdXBnIpu8E2ItKwwnagYS
         RB0quI+e4ceMfj1nsVbVjphk5u8mqa3IQHh5y/Z9OHfLklFD1Oht5vu6Gs+mGRamLzDt
         qoz3UWY8fXM5G9jnnzxJECaV2dayhz0msA9SUiCBv3hjXVuqtMKXKptO7eCmjqQEKmvK
         mw2A==
X-Forwarded-Encrypted: i=1; AJvYcCVrGNFYcSnGKyPvaQQjhMvA9Tk09sHshNiYcbQfU7Hg2cqihMhWFExth3QuT6AZRZvNIrA02obNHK2vEUQEjrj9@lists.infradead.org
X-Gm-Message-State: AOJu0YwjhLB8lOaljro0T0issDGvjBY8ZwCTgvxfhT9H4tsFLKeCsHz5
	8dn8MY+dXmbKXJvxX0jsj3hrX8jM010VbPMFSOPaofwgK5L6lfBTjjM27gqur0XuvNYEZ09lH8C
	yWS4uDy+XqyQw5Ro8yhQJJvTl+W2/4eY=
X-Gm-Gg: AZuq6aLGaZMuDxAw/vzgXBaof6vs361BzNdat3Lv14BuyZLoD+ccoHn15IAZ1ab0md3
	9Kw7sVN1s7gNYu1oSm1ccjvWyPXQaZEZIjoPV1GZR4qFdGz7I4vNybWAs8igubU3NMzVmDfV8Rl
	4aUOOivmjQheefcQllOGAdFWckrRKYShuiulsPz1rRfeNrGnmtBf4vsmojm4RaXFTLe2ipw9acw
	3AbyDzKWrGy2ZXH/NiryMmDlGQ6pBIZvBqmteuGvJMJMEoi+XupNY5cLpDXdEvXWLB2wY0HjREm
	YlvzZw==
X-Received: by 2002:a05:6402:3588:b0:659:3fca:24d0 with SMTP id
 4fb4d7f45d1cf-65bc7a8ae2dmr5047427a12.29.1771347939988; Tue, 17 Feb 2026
 09:05:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771258407.git.l.scorcia@gmail.com> <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
 <20260217-stereotyped-dazzling-loon-f06e18@quoll> <04a3d18b-80cc-4d1d-8657-cb35c4b5b797@collabora.com>
In-Reply-To: <04a3d18b-80cc-4d1d-8657-cb35c4b5b797@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Feb 2026 18:05:28 +0100
X-Gm-Features: AaiRm53iuI7SH76CEM094B1BEHtAFaoag8i5brp7UnlMPcM5xtOtDulZoBRUZlM
Message-ID: <CAORyz2+MgywrE0v+_UYt8gewq_eZ=ZgTUR66tL8aBbBQU53sDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_090542_459240_5D7E162A 
X-CRM114-Status: GOOD (  44.44  )
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

Thank you all for your feedback! As I just learnt about the
merge-window patch-freeze
period I'll wait until next Monday before submitting v3 including the
suggested changes.

Mmmh. Now I'm wondering if I should have added a Fixes tag to [1],
that's actually an
user-visible issue...

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20260209090516.14369-1-l.scorcia@gmail.com/

Il giorno mar 17 feb 2026 alle ore 10:03 AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> ha scritto:
>
> Il 17/02/26 08:58, Krzysztof Kozlowski ha scritto:
> > On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
> >> Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
> >> describe it as compatible with mt2701 instead. It is safe to do so because:
> >
> > You are not doing what you wrote. The dedicated mediatek,mt8167-dsi is
> > still there.
>  >
> > And if you want to describe mediatek,mt8167-dsi with OTHER
> > compatible (mt2701), it is a NAK. It is wrong and not allowed by writing
> > bindings doc.
>
> Sorry, that was my apparently very-bad advice - and I recognize that, as a
> maintainer, I should have given different advices.
>
> Still, check below the (bad, and not enough) reasons why I said that....
>
> >
> > You just added fallback, didn't you?
> >
> > Please wrap commit message according to Linux coding style / submission
> > process (neither too early nor over the limit):
> > https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> >
> > Please run scripts/checkpatch.pl on the patches and fix reported
> > warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> > patches and (probably) fix more warnings. Some warnings can be ignored,
> > especially from --strict run, but the code here looks like it needs a
> > fix. Feel free to get in touch if the warning is not clear.
> >
> >>
> >> - Bootloader doesn't rely on this single compatible; and
> >
> > Does not matter. You still CANNOT remove a compatible. If bootloader
> > starts to rely on this single compatible, you add it back? No.
> >
>
> The issue here is that "mediatek,mt8167-dsi" was never used anywhere, and that
> alone makes zero sense as it is - by hardware - identical to mt2701.
>
> That, leaving alone the fact that nothing anywhere can make use of a node with
> just `compatible = "mediatek,mt8167-dsi"`.
>
> If it is not acceptable to remove something that was never used and should've never
> been there "alone" without fallbacks, it's ok. I'm sure that avoiding to delete the
> one line is not a big deal there.
> Also remember that we are talking about an old SoC that will never see a bootchain
> overhaul, nor will it see new bootloaders.
>
> Though, just a small note - please please please: when we see new contributors,
> especially when they're community ones, can we try and encourage them to do the
> right things, and follow the right processes, without being harsh in any way?
>
> And P.S.: Yeah I know you haven't been as harsh as you can (rightfully) be, so
> thanks for that.
>
> Luca, I'm sorry again, at this point - it would be great if you could please send
> a v3 without the removal of that line. Just add the fallback and that's it :-)
>
> >> - There was never any upstreamed devicetree using this single compatible; and
> >> - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
> >>
> >> Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")
> >>
> >
> > There is never a blank line between tags.
>
> Yeah, agreed.
>
> Cheers,
> Angelo
>
> >
> >> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> >> ---
> >>   .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml   | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > Best regards,
> > Krzysztof
> >
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

