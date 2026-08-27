Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D39C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=; b=d1gzEYdAkvqFyJGxyNxQW6KOsE
	dBgTqjKGB2uFTH9gEnT6FI5HhKB4ArR937wWfWIPlS6jRV4lLaAJJ7rNiV42qdLl2malNTPZJWDvH
	Cm6F//a6krL7+r8p8pBssl9+yzPdlZYynR+WWBpB23zTf1FZSln21TRsoWa6i5uLOBRPoiTg6bqRO
	UmIUZgLFyCum7Mn81lIFbpCHTS5Hu09HMqWK5kr6rpfUDWTOY2D8X1igeI9FiVmJgcSbvhyxAXm4C
	NEStEA38DRYk5V+9n2yjfVb5aXaUDNCn1bttUYd8YPjR6glEiNsLaPZWAmI4GiC5Hmx3z4WbpaQm/
	omYVIvww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzc9V-00000004G49-3e6S;
	Thu, 27 Aug 2026 15:36:29 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzc9R-00000004G3e-2vkK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:36:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so77848a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787844984; x=1788449784; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=Rkg8dBTJwJeDLoDum30xYEVY+mp71tojbmo5SKN3tli8GKwjjitdm+XlUOZGHrTz4D
         v8t07TiO3dwiJrLd/+MBFX4tVL8ppM3S4sV5XHgH/6GD5wUpgFKInpzvQvZbLs0CQxZ1
         Tk2hdrpcJNNlhYQvjndG2r5ZQZXj9Uq/zbpk+oXqdDwLLzmDhcnhh0hcHRSt2bhefcmd
         Nmb9MS2NekKhAWbLAna5tW0NZVniyEv9uNjOMIik/1zRfAjJfpihCzaKw3FyPR4KRLL/
         /l7+NW9RYfQe304ybCQw5L4JjvDG8IOK4Het146pvH+Fhk3tMM4Xxjk7wZQUaTwWv69N
         kMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844984; x=1788449784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0GbLwFaHwwzrHQZ6KyEJK5JW6SPWToNlMJADlPNRPk=;
        b=dofRID/m2M8Omq2w21Gd3ndW1o0+H9BuOcf2p2JTjodwJ/5ETLUm/Vp7eUTngxR6/B
         8GpREFBhcQw47OkguabtUTZYIbDtik6lcGBB9kP8M75dKQoxWNMySvWu8h635DpRgKgv
         Glq1Mx+oqEo6nzMg+Bx41GEP/XEK61PajDkC7Q2eCqRHHHOVh+w/UDoctZ8wRZT/d/7+
         LE/b+V7CfJgMg1LwPXPQnXusOLCtXzovnQRTqEu22gg6h4btHke1gaCHufbYo9Rb7gC8
         nT9pgZuDu/6QmC1LXhX1ZoP36s3ptGskcCZxJmO5eqb4a//dOHtwaK5YBb1NpracjbF8
         hy+w==
X-Forwarded-Encrypted: i=1; AHgh+RqL9NwV6x4b6jCWkSxGEAxPCD/Ot8FMfUpqN4k/3BoGFNe7FAXptRzdoTgXbYUj2WCMGVhWM7KynuzBIlq5u2ko@lists.infradead.org
X-Gm-Message-State: AFuF++mPkFV3K56Yr2KV0W0vXAkx647JJzsKVBeP2YtBHDES5P20QDLj
	d3I1OnSeoJG15HrvSMV+jWs7CjNSXnmPODdB/mEFlcs1H7r3yVHK/hZQT8sJKgZDMTI=
X-Gm-Gg: AR+sD1368fl7+N2wuwt3m1hIrKaTjZxHmoiJ+jAqSEpJUVIrYJIqu7xUPpi8RDTT7Xp
	HdtC8hlGj+Lei2356mZjnk9Rzf6RhTsCeDbvjYvXGmuSTkiYNLBLNzQJClPIMOvXGj0hEQoItro
	vOjdtmtgYecE3Kpsv9Lc3gv3ZSBpgIVuE0oQV6ng6I6lG9UV/aVtYYXMz89d0B20ZZjE3oBZMLD
	Gqgcz4NA+NQm0bZ/eh9ELjohoLHiDmuT8qJf6IaMd7i3/rnjPsWEr2FKzH1Vihe3F+rByq7uQZh
	/TdjDgn4vyeKafDfnHfwHCwrkbptFagATFMo3gIKEimXFMa7neHrgoZXUg31/V4B7YNicKaT2+8
	zuk+qfsxqiUpM1MeIhvUc4firwiO0lx58ugn11lQuREMpNyd/uXpiyprNR/wy/r+pkS5TEZVqWt
	9scjh3jt99Udp4DNXz+gSysIV3X6X29E1olxR7VmOjYlcwRWnxc9edyo2fkzYdb9Kg
X-Received: by 2002:a17:90b:5188:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-396d0ea530emr169425a91.4.1787844984074;
        Thu, 27 Aug 2026 08:36:24 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:887f:45b3:fb30:8d79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm3187307a91.8.2026.08.27.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:36:23 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:36:20 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <apBZdNozfoCUp515@p14s>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <CANLsYkxZbr9hKaJJGXwYXErLwQ-A07eb-oeNXY1CceHHa0Tdmg@mail.gmail.com>
 <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8093FA9283357BF9604BE39F89AE2@PAXPR04MB8093.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_083625_761401_1787D3AB 
X-CRM114-Status: GOOD (  18.01  )
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

On Wed, Aug 26, 2026 at 06:36:54PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> 
> NXP Public
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, August 24, 2026 9:39 AM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
> > subnode support
> > > +          gpio@1 {
> > > +            compatible = "rpmsg-gpio";
> > > +            reg = <1>;
> > > +            gpio-controller;
> > > +            #gpio-cells = <2>;
> > > +            #interrupt-cells = <2>;
> > > +            interrupt-controller;
> > > +          };
> > > +        };
> >
> > As I (and Arnaud) have stated before, I don't think this is the best way to lay out
> > bindings for rpmsg-gpio nodes.  I am currently thinking about a representation
> > that aligns better with other virtio devices.
> >
> 
> Hi Mathieu,
> 
> Would you prefer that I wait until you finalize the layout before submitting the next version?
>

Let's wait until the DT format if is finalised.
 
> Shenwei
> 
> > > +      };
> > >      };
> > >  ...
> > > --
> > > 2.43.0
> > >

