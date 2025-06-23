Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8222C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 22:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XRx2ygGON68DaC/gtiwKh8VTYLOnLvGNtc5thNaQgcw=; b=MUBiY+AhYzgYjRI/SPg6RyrHAU
	3nmLMlL1/fu37yMCjBItH5T2DYlgYTGxcrvFx1rjNkz1VpxIk9aLCwppVo+meMRTY7UOrg5nPgNFE
	NnQEuPdB6UQn8v04IlKJa6QmqwncwAV2CgklusgneXg0Ul04RZQCQanjWzsK+O/zEpgSGq0M79uJH
	kkr072qyZT/gLauCTqquaSsta90mOzpz+BI7NKflW1iqTd/NONDSjp79x0u1c/Lz0H2zTWPxZfqS9
	Tk/nzCzsM5EDP0zRbHJKEpj328i167VFr8qY+r9mY3YyYz4vCrG1+0uvQlY0CRAWPd+tmexn7/PeZ
	dXzT+XKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpI4-000000044UE-1Snm;
	Mon, 23 Jun 2025 22:05:24 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkzz-00000003Z5n-22bX;
	Mon, 23 Jun 2025 17:30:28 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32b3b250621so41641221fa.2;
        Mon, 23 Jun 2025 10:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750699825; x=1751304625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRx2ygGON68DaC/gtiwKh8VTYLOnLvGNtc5thNaQgcw=;
        b=mQFIsLHlAh+qbmuv4aP7WBLYR9Pdh3YbC0yOMSRVHcpUT/OvksX26nKSSNAP8f2J7p
         A7mrAApQ9uX6F7xcVB+ZqAtQVBN0MsmSaBQ0cAvWaaSZkOalUbcfx8Mt4Jpf4Of1gA7t
         T1O0bG0iz64NdcUjaHPRsQz1BssQoQ7m0SnX3KgApx2r1UGeGzOwEJrAiXHTCV5GKY7R
         hElFZXSXqQnA/MwwsiNyjYOxZwjlrPKbQMzQ+leyyQOLGorpfxy2w5EvvJp2V5vsgbrd
         1NsgjjmEZ5TJMLza7oLqGerZQmpq6rJrfXtGnOyAPsPQXxPxNbbn5zv3XJ5m3cX3gVP4
         cO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750699825; x=1751304625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRx2ygGON68DaC/gtiwKh8VTYLOnLvGNtc5thNaQgcw=;
        b=TfYNnw2De18YpX4zXwsW6mGxT8Ks8AKFg8gL8Iu0pAA0Qwpv3aUFh0aAFARSPWWu4+
         pYKc2iVO+4+KpmB4xog0k1+SxQAi3LrJzPKRTh0jcaBKYQi9azsCar4N8x8OiVHy6rvd
         pT65O2wtHJX/xp+PAWzVvQsS0K4fcdu6iOX0d6fp/fcy2oYQYSqqtVIcqSNsR1WzR998
         +NwVoxXevkWlzGMvZUy0CH937yT6ie8fBwJ8PDJOvq3ZFa0uxELeI5mIt2RsmAB5N9iA
         eMeSDjIRyMtx9fgaQg6AAaxPpMpd8D6TiGV4ji5lE6ydPNCv8lKnFEu21ER3TTfuOdwB
         439g==
X-Forwarded-Encrypted: i=1; AJvYcCUxeJdbAAchf23fbO7HY7wweUk3i6nkjtaJYdSWU9q9bZc2sTZRzbNH+96t2d3uHuLQI4nUhbypK2Q5ugyboQs=@lists.infradead.org, AJvYcCXA/u2n0yJM0n2JzE/TNwF/lHPDDW6631VqfJWG5AIWiCAzFzy6ewaEtUYSjmiO2D+SLNsYE0b7t4GTHLteZGxT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/JN03dMr42FVHHVqwUacgsOskXPIcrs3MwXmJ2LMwslrO1TfT
	5kSfZl8kJ4S/wojCJA0zG65Dpxc61+WhO1rFMEmaZ/f2AAN+Mh5NXJQxf294t3+xID9UKS5yqjU
	R739GdlyQagvnvkgMX5lj5cUgeI77XxQ=
X-Gm-Gg: ASbGnctPt1+y4AhEraDW8Z9Vjg0G+FlHKm1lXFN4xD5brzoLEtj6nITI4YUDce5GQ9x
	CIf+t3rC9Qz3SqZXo4SAwLb8HLn2tF4gWuvSd2RryNyqujpMc1xqYMqTSII5AvluGOYMy4bi9Ue
	/4/RX1ZAu3kK38HFTGHZPTCsOWZvQCqx3ijV/q30gh5A==
X-Google-Smtp-Source: AGHT+IHyqF/zUWPtp+0ZEzV6kVohh/dVuHVOrwyoaqqRb8CbyietJFOO8QAtGYViBm0uTfYLshN81twTdhq7CL9TmZ8=
X-Received: by 2002:a2e:bc05:0:b0:32c:a006:2a1d with SMTP id
 38308e7fff4ca-32ca0062f65mr19202371fa.4.1750699824943; Mon, 23 Jun 2025
 10:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250623102359.2684-1-ot_zhangchao.zhang@mediatek.com>
 <20250623102359.2684-2-ot_zhangchao.zhang@mediatek.com> <3df0b3f2-0d73-4116-8bbf-37020892e773@kernel.org>
In-Reply-To: <3df0b3f2-0d73-4116-8bbf-37020892e773@kernel.org>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 23 Jun 2025 13:30:12 -0400
X-Gm-Features: AX0GCFsnpLQwwKtnijqZGlv0tstZiyS3XM4yXHsIdV3Lgvijxwc-1eNX5GxkkhQ
Message-ID: <CABBYNZJ8qJTjyzfZBBCbYCon1zinRbxOmUvvPbheqUNSTh13_Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] Bluetooth: mediatek: add gpio pin to reset bt
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Chris Lu <chris.lu@mediatek.com>, Hao Qin <Hao.qin@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_103027_552499_6BCB20C7 
X-CRM114-Status: GOOD (  24.46  )
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

Hi,

On Mon, Jun 23, 2025 at 7:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/06/2025 12:23, Zhangchao Zhang wrote:
> > Makes the platform Bluetooth to be reset by hardware pin,
> > it provides two methods to do it for mediatek controller,
> > and it has been tested locally many times and can reset normally.
> >
> > When an exception occurs, resetting Bluetooth by hardware pin
> > is more stable than resetting Bluetooth by software.
> > If the corresponding pin is not found in dts,
> > bluetooth can also be reset successfully.
> >
> > Co-developed: Hao Qin <hao.qin@mediatek.com>
> > Co-developed: Chris Lu <chris.lu@mediatek.com>
> > Co-developed: Jiande Lu <jiande.lu@mediatek.com>
> > Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
> > ---
> >  drivers/bluetooth/btmtk.c | 69 +++++++++++++++++++++++++++++++++++++++
> >  drivers/bluetooth/btmtk.h |  5 +++
> >  2 files changed, 74 insertions(+)
> >
> > diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> > index 4390fd571dbd..3e5f3ca6f0d5 100644
> > --- a/drivers/bluetooth/btmtk.c
> > +++ b/drivers/bluetooth/btmtk.c
> > @@ -6,6 +6,8 @@
> >  #include <linux/firmware.h>
> >  #include <linux/usb.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/of.h>
> > +#include <linux/of_gpio.h>
> >  #include <linux/unaligned.h>
> >
> >  #include <net/bluetooth/bluetooth.h>
> > @@ -109,6 +111,65 @@ static void btmtk_coredump_notify(struct hci_dev *=
hdev, int state)
> >       }
> >  }
> >
> > +static void btmtk_reset_by_gpio_work(struct work_struct *work)
> > +{
> > +     struct btmtk_reset_gpio *reset_gpio_data =3D
> > +                     container_of(work, struct btmtk_reset_gpio, reset=
_work.work);
> > +
> > +     gpio_direction_output(reset_gpio_data->gpio_number, 1);
> > +     kfree(reset_gpio_data);
> > +}
> > +
> > +static int btmtk_reset_by_gpio(struct hci_dev *hdev)
> > +{
> > +     struct btmtk_data *data =3D hci_get_priv(hdev);
> > +     struct btmtk_reset_gpio *reset_gpio_data;
> > +     struct device_node *node;
> > +     int reset_gpio_number;
> > +
> > +     node =3D of_find_compatible_node(NULL, NULL, "mediatek,usb-blueto=
oth");
>
>
> Can you finally respond to the comments you got weeks ago at v1?
>
> NAK and I will keep NAKing your patches because total disregard to
> review is not going to make this patch accepted.

Can someone at mediatek respond to Krzysztof, he is the maintainer of
device tree, so he has the authority to NAK patches so you guys better
start addressing his requests.

--=20
Luiz Augusto von Dentz

