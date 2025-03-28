Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43F1C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 10:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVEU9Z9Cc8B9W4xNNyEcyh6tlvqC6ybG2jaMWegweJs=; b=3SAwQop3K0JYq0NFD6mH66cTei
	w3EZ+20nJvyyU/k7jf1Gr5phJ9x5QQQ8ySMgBuKwlriSDSmO1QNB/euDq4+RfTJ4jSYSqlkipKC0j
	bk4SkK989AT4Em7F0vfRTqxnP1J4SnKBKrtF6E+1EfLtpZokfVbz3QgOdNKyDkLgWz2VOLQj/6iDd
	8BpVK7tEa9sTJxKsNLnuQsggQ9/w0dSuvf9+RpToRen3PCDDrIvGRhh5iUQDTuGH7qaKbrawGZmJZ
	KBd6xzcWYjDkizuqMl+gm5D8UZ2k5xKtoiqkX/osL0rkDjvTHVIfN7bHCkGDXy1FfHmFIIlpH7u+V
	oGSzQHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6bL-0000000D5V1-1tNo;
	Fri, 28 Mar 2025 10:06:11 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6Za-0000000D57K-2kJP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:04:23 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54993c68ba0so2060483e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743156260; x=1743761060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVEU9Z9Cc8B9W4xNNyEcyh6tlvqC6ybG2jaMWegweJs=;
        b=QLvAVmqKeIiJSbaffybLYGdlOA9eQu9T6BTThwWOuPiOHl7Av1aUMP9CZicPvjmvbI
         nHy3OXXdS4XtG91RGXBokAKZqck8rcN8vubyS9UKpxl1HYcgY2NZoCjD6QrQI5V8Kzev
         5sJhb2mmQOLFYBthDzVgV6JuS7yVQIObENv5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743156260; x=1743761060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVEU9Z9Cc8B9W4xNNyEcyh6tlvqC6ybG2jaMWegweJs=;
        b=O4fjRae4+2A1pkwbxyCoHlweujqTyrYNxLDDKqHz0fMeFmtcSMkkPJWqO/6QaVI5Uj
         x9jH9zWQcKTnXxfuCNKPuP0sjTHT43h2NrNCadSbVRJsdKk4zP3uplGddWHb8XL46kN6
         PODvCtcGtGMar/mTkx1MrSz8nR4bHR+25TryeG1Sw2E6AQ6Y1IkL1PD9pUpgCpRu57TI
         rLuLV9uuXz1n1yZydPd+Pey/diyN0K73cTTbF9ISdD5+ojCSJdyUbQ7jttpD2E3V5SSp
         oCEesoWzGY8ww+ZpzOERCPP2s0NfPqw3hGl/KmrcppMnKDGDb8wPgZXXKeEBwBX75Ps2
         2qRA==
X-Forwarded-Encrypted: i=1; AJvYcCUpaAs+EQX0G4nKzZqXCoDHU/B1Cjw/Kqm6ccg9q+77ekX/CeDXbap92B77wM9rwmwZGQXvZ1fWBAibMqY4CgRG@lists.infradead.org
X-Gm-Message-State: AOJu0YzxvYWY9qdO8jn4YXg7OKozMeeaRnh03QCFt7J4PRxxaiMHZar1
	ZiN8fpdjARVqaUoI0kI7511m5f/23A0tV4q4074NcQez7AjMkSNSIDNuE7I+mCRi/F+xkga5lBm
	fao54vdOUpZQ6GyOVly7sGvAUDT/AK6eg/t+H
X-Gm-Gg: ASbGnct8UB5xdb02OII3nYjKMUbZBszpO5LTU7bGf4gkZ63THgSnKfefuAqZIM94HhQ
	BDURcztj+XuxGlYIL8ANpbcnrLwhrRV6iXUpMdcGpLBvBcQ0LE1f3eGjfwTmBqTfeo8fQYQvHnw
	gBLeDYARnl41CHSSR2fWrtGy2m9UAPnthsfSdE2t85k2LKBO8S70OoYw==
X-Google-Smtp-Source: AGHT+IHePVtXJ1qJQdbP4+JraAsng3JxPcp8ln2qAoF7z/+m2DWfYuVxIC5W1TfslB1L3LezP+QcBUJ4Mmt/gRVxkjw=
X-Received: by 2002:ac2:4e16:0:b0:549:7145:5d2f with SMTP id
 2adb3069b0e04-54b01221f44mr2788893e87.33.1743156260501; Fri, 28 Mar 2025
 03:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-fix-mtk-iommu-error-v1-1-df969158e752@collabora.com>
In-Reply-To: <20250327-fix-mtk-iommu-error-v1-1-df969158e752@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 28 Mar 2025 18:04:09 +0800
X-Gm-Features: AQ5f1JruRldxLi3oN3F4vGRjnP_jRoig-8O423pVAOXUeHgChYU13ECJHzNzG14
Message-ID: <CAGXv+5HAa0-AXg6=htNappreR5-9sPHNp7L9ByEBq4XZxADBXw@mail.gmail.com>
Subject: Re: [PATCH] iommu/mediatek: Fix NULL pointer deference in mtk_iommu_device_group
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, kernel@collabora.com, Joerg Roedel <jroedel@suse.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_030422_716910_9D1636F8 
X-CRM114-Status: GOOD (  10.70  )
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

On Thu, Mar 27, 2025 at 6:48=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> Currently, mtk_iommu calls during probe iommu_device_register before
> the hw_list from driver data is initialized. Since iommu probing issue
> fix, it leads to NULL pointer dereference in mtk_iommu_device_group when
> hw_list is accessed with list_first_entry (not null safe).
>
> So, change the call order to ensure iommu_device_register is called
> after the driver data are initialized.
>
> Fixes: 9e3a2a643653 ("iommu/mediatek: Adapt sharing and non-sharing pgtab=
le case")
> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe pa=
th")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8183 Juniper, MT8186 Tenta=
cruel

