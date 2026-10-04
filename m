Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E416CCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 12:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfYr76LOTu8jVRzggIwBN8xVUqu42mEkcSJCjGTgQ0g=; b=cK1N3lA1BB5VmG
	4fgFBW08vVC4kZpO77sDCU/0odtfiWM64FSqgEdRh3g+h3UP+LHFDiglH4+cCfsHYpOhSBoVN51bW
	Zs4ASSQnMcTPq+xbVZr/UI2EJXuNN+DW2qWIQU0mMuLpe1dPzmX3A94KSBwHntfrZkzwHKLOSGn/D
	N7brsnUDq9LQ2WUNH9EGY3xJmDcI3oohuQ8uzSU60WD91uuB+xK1kFlpU7TgoJPihsqiPyIzGKo0Q
	SoY4ce6b92PAj9NvoqGO2APPrhbuMfIBkuqEtOJfthxxmXwr1+Ba4vim7OuPByYt58H+e+2tSyuCU
	Cw11fOn+yg3b8AaYo7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDLDR-0000000Empw-1V0Z;
	Sun, 04 Oct 2026 12:21:17 +0000
Received: from mail-qk2-f41.google.com ([74.125.230.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDLDM-0000000EmpX-2pHy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 12:21:14 +0000
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93df7b21008so84321885a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 05:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791116471; x=1791721271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfYr76LOTu8jVRzggIwBN8xVUqu42mEkcSJCjGTgQ0g=;
        b=G/lnEk2NopUQuqO6bM/M7z25TCkSEhT/UKM14dIqCZ5R1LOZxImz7L+F84Aw4Cbwjl
         QekWGBvfuP3dOJ/GpnzUPaKfuShRK45Ae3/eeKDTBsye6JF7uN6p208pOEOEbwCxZCRR
         bforNnFqnC4kjOhz9PaEUK8wFxLjZvc+CQgfha41J+EcrIYA4al5AvbQyl5dcVU97Wys
         w7Ku9FvWi4qHE5T/6Ot+TFMv8zzCIcVeVY04iDeF9lMGy/gOu0RUhU4oH/+N8cX4D1lZ
         R+tdMKbSaUVBRw9yBz6u4rrIj+DFR6L87yDHdWvpoT5CguafnUyPsNCEOpis7mTqrgWT
         +9hg==
X-Forwarded-Encrypted: i=1; AKwUvBxOC8iMZ9ebjMLnKJj0zkOvqOUCaUsUjclF8SKblqePfwAJCS9sOBDeGYpyHOeXE9OnZ7IAJfAgmRP4TtPlnMjH@lists.infradead.org
X-Gm-Message-State: AFuF++nKViAVADv4Em0h/ype5IyRr3T68XUjDCVHtVDmJZrXH4X7Bkjl
	+kwdH5OssdTR605vxebAFzZLZNq/R0m8sg3kWgTAosorqyhLC1wIHdXnfw0ECS8q0lD6kQ==
X-Gm-Gg: AYBFou399b2gYNWTY81NIlfuduxfnxggYZsGqOXzp0F/ja4+HWknAMLWm2tkS7O5Oso
	3H+ZjxZG22KGLx0RMDM1UWDd0L3Kv+21HbxRkZ376qVUg1V80NqS1h9W2TFlEUmeFRAAe83cWnX
	b2CQJ9v8//rNpWBfw1KkrB7ZZDfhfVgbAYHiw59EXNVulk27l8B4WxQvLwj2/LAjeqA1Ec7TB1m
	jXl2BeOw9519jgT7LXqmLsIFs/mZFmwnYN77kX7cK6/Z2FQvWCOZS1in/fG6xC+74RrLV5Hx0S0
	xRP3pbePJeucWjlSLTg3WXxHYDQZP8TDtiupdTltHsow7UpU7hukAqGkJa4JN34DFkt+0ElXHVz
	jhdY7CI9ZpVee9lkGu+V+F1lFapFBIViljMQIj0nLeNLxHmO/gNtOv0mNj2c6rG2+UCN4CoEvHl
	j2xjj6x7+6GONHdo3xYHPUnMtQo2mS2VgaIhkIw2eTGnjud9IvTTfbi59rErvCy/ftSWlkBigK9
	WFfK2peIs70b1gi3wRieWlZ8PIxsfFgvEC+4WgReEOPHj6Johjm4/sKQhLCilWF
X-Received: by 2002:a05:620a:4713:b0:939:ab90:8f6a with SMTP id af79cd13be357-93ce82c5a53mr1594536285a.18.1791116471076;
        Sun, 04 Oct 2026 05:21:11 -0700 (PDT)
Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com. [74.125.230.204])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e4e9b4071sm422013185a.23.2026.10.04.05.21.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 05:21:10 -0700 (PDT)
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ef1d0so6280521cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 05:21:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWRbtADO0QQa9/xBrVr2s+WepX3VJJF+dHExqZsUxhtwvJbxskFyM8Mhm4r/P2DUKqj/KyYSdxF2LAZWNuxFbw@lists.infradead.org
X-Received: by 2002:a05:690e:d01:b0:66f:7e05:c3f8 with SMTP id
 956f58d0204a3-677ac00785emr2680725d50.42.1791116014048; Sun, 04 Oct 2026
 05:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260905153234.133217-1-tanure@linux.com> <20260905153234.133217-5-tanure@linux.com>
 <aqSX-kUvYaixESxe@redhat.com> <CAJX_Q+2vpcFw-5evCkykwWo6jbHvKvQ4XjYt_EKFyJuQm_ES5g@mail.gmail.com>
 <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jcxui79k0.fsf@starbuckisacylon.baylibre.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 4 Oct 2026 13:13:22 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+0T=k44tHbJ5BSAsD-RvpytA6mLu1FKu_2GZgYucorXNw@mail.gmail.com>
X-Gm-Features: AclHuK8rosb4K--WkyZLuEcRV46M1KSWdwcM-4rWMY7HfYobH2sNfTEc1o2MX3w
Message-ID: <CAJX_Q+0T=k44tHbJ5BSAsD-RvpytA6mLu1FKu_2GZgYucorXNw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
	Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_052112_740870_A9D393AB 
X-CRM114-Status: GOOD (  33.72  )
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
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Sep 12, 2026 at 4:51=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> On sam. 12 sept. 2026 at 08:50, Lucas Tanure <tanure@linux.com> wrote:
>
> > On Sat, Sep 12, 2026 at 1:08=E2=80=AFAM Brian Masney <bmasney@redhat.co=
m> wrote:
> >>
> >> Hi Lucas,
> >>
> >> On Sat, Sep 05, 2026 at 04:32:34PM +0100, Lucas Tanure wrote:
> >> > sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> >> > between the SD/eMMC controllers and the NIC_MATRIX fabric. It does h=
ave
> >> > identifiable consumers - the three MMC controllers - so marking it
> >> > critical was the wrong tool: the clock should be referenced from the
> >> > consumer nodes and claimed by the mmc driver instead.
> >> >
> >> > Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> >> > sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself =
and
> >> > have no single identifiable consumer.
> >> >
> >> > Assisted-by: Claude:claude-fable-5
> >> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> >> > ---
> >> > This patch depends on the MMC controllers actually referencing the c=
lock:
> >> > the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> >> > clock must land before this patch, otherwise the boot hangs and memo=
ry
> >> > corruption this clock caused are reintroduced.
> >>
> >> This series should be merged together in one tree? Which tree? I can
> >> provide an Acked-by if it should go through the mmc tree.
> >>
> >> Brian
> >>
> > It's definitely best to keep the series together in one tree to avoid
> > boot regressions,
> > but I think the clk tree is the better fit since the core changes
> > revolve around clock logic.
> > Could you accept it ?
>
> No. This applies on top of another change already queued in the amlogic
> clock tree. It can't go through the MMC tree at the moment.
>
> This clock is not critical in mainline right now, so
> 1) I could merge this and it and in practice there would be no
>    regression. The problem you had would still be there until the MMC
>    change lands
>
> 2) Or you can wait for the MMC stuff to land and re-submit this in
>    the next cycle.
>
> Your choice. IMO, (1) is fine.
>
> >
> > thanks
> > lucas
>
> --
> Jerome
Hi Jerome,

Sorry for the late reply. The MMC side is in next now, so the clock has
a real consumer.

Can you take this patch dropping the sys_ampipe_nand part or
should I re-submit a new version dropping sys_ampipe_nand change and
only marking sys_am2axi0/1/2 as critical?

Thanks
Lucas

