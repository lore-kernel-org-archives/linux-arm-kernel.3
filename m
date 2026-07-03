Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5710C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=; b=a1Ryo70fNPguKd04Bpq91g3SDS
	RKvBUXr1hsY7FwBv0aZtFYj2QnfR6bNEY9tyILdmN9Uhx7pZQdRhq7FKidyymD9ga5Uuv0h+KdowX
	ykFwR/fiQYGZkmpG4CnV+9pdFmcL/JTWQTP3mKq3jLlE7rEXyvXgv3d7eixkYSDD8AOotV5EloqrN
	H0JyjFYwPTGtOZ2XgOgdAI5FcfAxp8gBMZeDIwCsXV/9a8K3hCoxoDDKXulpDXcR3Tebk9qAx379j
	+58zKKSRRMC9iarESfpu6vKAXaFfX292hZ+1NeIJYkTMCUDP4+ZSbsAox6OtJXqf5gTgSL5ypslDj
	JtV+n7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfduE-000000075S2-1rUL;
	Fri, 03 Jul 2026 13:26:10 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfduC-000000075RJ-30tB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:26:09 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6662551100bso765921d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 06:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783085167; cv=none;
        d=google.com; s=arc-20260327;
        b=mGAP9c3g8fu1RQQ8n9LACvrfNhhopNfrEXtXyVD5FAm1849K6Dd1d1UKR+XCYxUrCf
         7eslxHno4AngAvot9nbAu9BKH/NPjyUT6dTJu52u4Ms/LBR4MRZLRBRbIlGnkmKD5Tvd
         KoOnt8d3J3Nh82WDGGOYan6Ke4X5H49jTsbTMkZAyg23nlXOT8qCRDv0+Rfpw8KWuSXd
         g5ex0gszga4LkY/LzPDSvCnr+aRPMq7+vwQawIKE0DWw7HCUBO2tv2N9HallRL/A9+M1
         1vRCYTUL18UwMT5/gS9TrW3n+TP+K1ybWUWMUN4TsJINXma1FqkT971q8tsAKqr4AJQR
         Au8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        fh=HFGk0RHxP6DGjzKBOFWY0NPdB6sOn/QIluNV0lfVQ5Y=;
        b=I0G1f02pON4sFGzb4Yu2DVdP6JBIvl6LrvCzeXlPDBWV5xlykqaV9c3dnjCU9puDXF
         dtOWqhl0eGB5RqnOqpBpyrNfeI2V8X8DiNHb2kfkzcYQmx7y2GNdHgOzaoT7a1CM7rOk
         DPNsU/ZwbZg02Cr3+5H5cvKpS8iBUCoYjhIU9NARAI6Dxxe6JC6xhY22wpbYehPiq5aP
         DfiJa+QUMFbrUGCNhbb9uisN9j/a+j5hxxzGhbOSg0UySt34Poi9ob5LdYdp2OW8kpdR
         hC/tG2PxmTkVNyXyTWjs7ycqAAwqvqYMw+WBPB2/w4ZxYlY5EHNdpNPPDm89/+9mMi3T
         8puA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783085167; x=1783689967; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        b=BfR+bwkWbCBlTApq3LW8bA6HM6BfNjlXiCeg/mjOZwy8PcSKMXqel6hvh+GAh7J7VV
         Bv4N+pzikUhRkRwI5PwyaePPPKID5vBgi5YA6O6fGLDgtxII050h3O0D2oGAmudD8Tcz
         n9bVyA2k4eq+1m7BSqpR6kN/tutl2akESfPEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783085167; x=1783689967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4zhLhFMp7O4gmnRm5uDgMPugvo8rGAGH9W/oNg9Rsc=;
        b=Dpz1r9S5Qvqetvs0KwA+SoA9H78xV5gHPACQDLW9FJxD9MikYgjQXd2uFxVY7GJ52Y
         DzsRMQR30DVJvp5hM08VAen0lux5bID1ZvXL+khWJRcDUJXwhX2sx3dbdoLMvpquX0QM
         xi34gKk6r7aNy8AbwVkUESVHBYHzZ3m+HPeR2I+fVAhHbg3ImWZ32sUnN3UrUbDrCEwr
         2nlRt7W3bSID9iCAuWAhq/RUehsMzd/2lZt0rBVxw8TRPaeUTSE194Mjx+b8c/u0ZTq3
         1O1wQcVp8oM2b1w0VZTFkOZfkUwZeZvoZrr1Gg0kTQJzm4Kl9PgLIQNrKxiUaB6nFzM3
         F6Kw==
X-Forwarded-Encrypted: i=1; AHgh+Rqk/01z6x2jCfslqu2nYXgF1Qp8v/H2PPsJGjURYTvwWM/+KM63lvEU56ozkroj4TvOLKjIrhq8qPmCiaS0uCy0@lists.infradead.org
X-Gm-Message-State: AOJu0YzUSw989L3hoSSiDA8eQo/840aYsIvuNcLAlhJ0kBmoeu7n4cUs
	ls/DbTnOmq11USj1gEC6RxZkOasN9FpgHMiEyWw2mlVwcupxrzZWb5gAPQa3IeMQorWq+Rf49Xb
	o+aAlLTQU7u2pw69j3FlQwyqMeTKr5gGeCqRUhtPn
X-Gm-Gg: AfdE7ckncO/goFiO/zCF6oUIGe678nLhZvuHC8LzKr/DWe2jTO2Ib2lxpIQYJM66o8B
	wcBnshDdUddzQ7iMvkXrH2Mh75jt7GfSdGpIPy21WsgMYW4uZ2wIraXMc3EaNjM+TkqFeE7LrOK
	Rc/fuhE92wkvg3geV+Hlh+fUi3IgsbFRAtYZBDgbMu+6Ldxp9OmXJ8kRxJLznRc+gALQMKqnbJ2
	F5O5vrelP8vE9GLdlpGF0iFGRqsd+m4LRiAQeW2u+/hUMBUGGg4cVcjdxPGKCmOLAqxLNp5CZYv
	R2G1KrmR/rkr+EsHGNC5gNOn2W2QT9Y0kJzQOQ==
X-Received: by 2002:a05:690e:480f:b0:664:fc22:36cd with SMTP id
 956f58d0204a3-66521ad34dcmr7426372d50.43.1783085167252; Fri, 03 Jul 2026
 06:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-6-wenst@chromium.org>
 <akeyxn390mVmYo83@ashevche-desk.local>
In-Reply-To: <akeyxn390mVmYo83@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:25:56 +0800
X-Gm-Features: AVVi8CePOG6OpnrlSpGFhkpL2GOtwCFUk_NB8IIc5qFTOLO5i-BW3OK69XKCfdo
Message-ID: <CAGXv+5G3ETTGbgjWJCbQjn9yvRamx4GHPxjWPgmy_aXWUxm0iQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_062608_812524_6DDD00A8 
X-CRM114-Status: GOOD (  16.68  )
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

On Fri, Jul 3, 2026 at 9:02=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 07:03:06PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
>
> Now I'm more confident that it does not mess up with ACPI case.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you and Bartosz for the reviews.

FTR Sashiko pointed out that this is likely leaking a fwnode reference.
I will add a fwnode_handle_put() call to usb_hub_remove_port_device()
in the next version.


ChenYu

