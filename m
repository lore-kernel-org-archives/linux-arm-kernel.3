Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18F0C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=z96/yzgqxZwebx+1STswIi+Go/ctjBNtJnkegSe2jjQ=; b=zIs2qlUhDt9uQnrlFadZ+XFxjZ
	XIpBLdiwyDqICT8bgJxoZ5RGtLmaTop8r1W6DaC46oHxGzVVyYqlK8atFIJ+XK/a7jmPs4qywicYM
	DFkgGEko0c+eN3Htm+3jrQJ9hE33nKSlJ0Ultu1Ps+FBpopfp0DjcroEi/0vUw6jtGNlAOQmuYF6h
	90tWVvlS4sJVptQOaJDG/eowJhGSxP40uq3SvYLlzP3P8bR7NVXc3GwZA326SOhEUaVIuWe+EHeC/
	h5gd4Qvp+jnjiUT6s0rlu8HtccyGmsRNZuv3euKxZJpITj2MoO6CTh9FjOIpNAZB+/hW/VrB+27El
	AfN1iutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dce-0000000EIwL-0UgA;
	Thu, 10 Sep 2026 12:11:20 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dcb-0000000EIvX-0pth
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:11:19 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so5816646eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789042276; x=1789647076; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z96/yzgqxZwebx+1STswIi+Go/ctjBNtJnkegSe2jjQ=;
        b=Zyvrn8WzMC6NZla/QgtjfZZfAemcSVasBHcdjM8U8UngbvP5pruTxjMn/n/7WEOpuR
         chcAC4nztqUMItaW20d17nyjfK8PeO+XbtwvdcuTpUfaSCejQmtCyZU1PO09foWlkeVL
         QgGqzJj8ZFLgmZQFTIR813rWIIowgZVVgUu+TpgwLSaXc9gSal/+6nESxa2aVgWBAGt9
         3cYOcIXcc3jFpJUsio7cn56yIQa7gMeKDnH+xyde8d78BK6ieikYy2apFbxPw23Csvnk
         L1Pwo0XAsMOo2VJTkivunLJxQEUU0sZuTwRVuc+wawl2lcKaY1xQoSd0onsp48GUzqPi
         QtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789042276; x=1789647076;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z96/yzgqxZwebx+1STswIi+Go/ctjBNtJnkegSe2jjQ=;
        b=e7lcADmhxzebfHERvu3e10CwSximG1rKt/VuVH4GymuGFk9p7yQo9rN6/zQllptoyW
         QVVkQqsCRsck3w7C5+KMLzKvQR6RcL9a4eikmyxLtehe+3tqf/VToUx9rmyMsN8t6xBp
         VVwKb01bR5gkviWayogJ0EuWCtKanFcLAZcfGZ3UnLT+UuGPTQxlSMQT4xDXyvkD4QTU
         1Xkm9YGU5fKlbZgYEHcxaPUsLxe0lnnGgwGvqgjSGrVHIgCiZVByFFx3HYfmHCP5s2jg
         zsZQte5GpPNYpCJ5GDpFrWxF1tYoiLuMANZTRmEJAEu8nVjfTik3C/SRrPmckyFdi1oi
         IiqA==
X-Forwarded-Encrypted: i=1; AKwUvBxpXm+kXtez2DypkXvlYIxoXc64pjw2SX45glnvzjoqagsjpPZcznnmsO7jxDYuYy+q87V/rFXX17JVGHOg6QyK@lists.infradead.org
X-Gm-Message-State: AFuF++msOKZVqUjJlWbfmczm4BXqGAg0W065xfQY8537suEnWQyT3VeK
	+jeyWYva1U/74FioNLlvnDJllKlqJYnBQ0o7G3myszLnNGgy4gFMzso=
X-Gm-Gg: AYBFou0GHuUphr6lz4/d0xWl0v2cM92G11jBnUD7fVedIYsRlmSmYMGQKhrRmayxeoH
	PDV9S8OHCvWONkgjnjSN7X7yVIIDafl47/oWyVcptOcDBZGCh2yNzKz0Q7ZVoKdtQDJMX51LSb+
	Y4Z8rNXxUlA2crmvoiZNAKl/NG45oQIBpAlgqliixowhj/KPM1Q8s4bVZFaJcfcjBQJgi/4nfb7
	Mzxj/0e32gGPzBHeeo00GU+91hDJlEG/5URDAlhw+1OSny+T5Qrkv5WTJUT5ZbuTMoezEbGBHjZ
	iPLw4fW4QHMrc03I6nTyrqWCnHlqyK4Mupi8XCrePHOfUHoXgN++FBMosjMqdX3pVzgEI4NSiWQ
	hkN3a/neAZk/ZH3SJYjwXEqQ0GDff1luPLeGSP4Nrbudflfou+FMRNWpJoXq7+/It/7y1AxBkEs
	PnNqWZYX2ULUPl2uQ+zZCRm2MKS9R6pktHg5s2o+mdrNNYTprSDcC4vIIIdd7LY4ps0O4KdsIuW
	KCusewVDU4ccwHLujXBPO8ORxBqLoc9Cg5F/aE2n2RmODOq
X-Received: by 2002:a4a:e84a:0:b0:6b1:4a71:775a with SMTP id 006d021491bc7-6b6fcbde97emr22252414eaf.19.1789042276189;
        Thu, 10 Sep 2026 05:11:16 -0700 (PDT)
Received: from matheus-note.localnet ([2804:7f0:84b3:2201:fb27:8354:17d:2bcc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm53156354eec.26.2026.09.10.05.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:11:15 -0700 (PDT)
From: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
To: andrew@lunn.ch
Cc: 25181214217@stu.xidian.edu.cn, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, b.larsson@gmx.com, cjd@cjdns.fr,
 conor+dt@kernel.org, davem@davemloft.net, devicetree@vger.kernel.org,
 dong100@mucse.com, edumazet@google.com, enelsonmoore@gmail.com,
 han.junyang@zte.com.cn, hkallweit1@gmail.com, jes@trained-monkey.org,
 krzk+dt@kernel.org, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, maxime.chevallier@bootlin.com, naseefkm@gmail.com,
 netdev@vger.kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, vadim.fedorenko@linux.dev, wangruikang@iscas.ac.cn,
 xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: econet: add EN751221 ethernet
Date: Thu, 10 Sep 2026 09:11:01 -0300
Message-ID: <0bwM5hNxQhuX7GLiig7ffg@gmail.com>
In-Reply-To: <a9eac625-f0f3-47db-ac2c-26c7df66f52a@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_051118_363048_B123CA2D 
X-CRM114-Status: UNSURE (   9.60  )
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

> That is a very unusual phy-mode. Is there a reason this is used in the
> example?
>
> 	Andrew

the GDM1 and GDM2 behave something similar to the newer Airoha, we have an MT7530 connected to the GDM1 as internal mode, and the GDM2 is also an internal one that communicates with the xPON and xDSL subsystem.

the en751221 has two mt7530 switches, the dsa0 limited to 10/100Mbps and a dsa2 1GbE connected to port 5 of the dsa1 in cascaded mode, but it varies from chip to chip



