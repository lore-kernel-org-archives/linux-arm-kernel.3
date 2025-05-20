Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AE4C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h4CDsU5Y4vzgEhZFP9XVBoQdkH1ySwJjqkH2k22fbs=; b=QqmAINESOp6XW7aqm3mYT4C4y9
	SMA5YFv4I3bZwEh2Lm5s81YiLD3XIUnxe3Cwy5FScVhmJikLkQJr8SnJINGLDNMm3FvjtV3MxiIC5
	S+8RWKMzQHa/MV04mF7I35ZvXHIrDO6bQcXfeurkYvg1aIPPyEvc3gB1ccudvGS6WBUI4TwYfgzjQ
	zk3DFDzCtI2sA9zoHQuTcPHb/xeOh+JrSxatBSOivaR2T2UEhHujCZhtn/NS5GXCIenwX/19jDAFU
	66pcwkh9upUZvhw3jH6v1K7/nx5EraXC9HzAuUjP20+PE1n1VWkmoL63i+Q/1yggQRwChEO4lvo1e
	5eZjEBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLIc-0000000Cfg1-18mb;
	Tue, 20 May 2025 11:38:22 +0000
Received: from [195.187.100.5] (helo=ni.piap.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHL0D-0000000CbhT-0CfT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 11:19:22 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 6D479C405A49;
	Tue, 20 May 2025 13:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 6D479C405A49
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  linux-media@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i.MX8 ISI crossbar: simplify a couple of error messages
In-Reply-To: <20250509091549.GD28896@pendragon.ideasonboard.com> (Laurent
	Pinchart's message of "Fri, 9 May 2025 11:15:49 +0200")
References: <m3plgi9pwu.fsf@t19.piap.pl>
	<20250509091549.GD28896@pendragon.ideasonboard.com>
Date: Tue, 20 May 2025 13:19:12 +0200
Message-ID: <m3sekz8r7z.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_041921_256402_76CD9A11 
X-CRM114-Status: UNSURE (   9.15  )
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

Hi Laurent,

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> The goal was indeed to save memory.
>
>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>> @@ -352,9 +352,8 @@ static int mxc_isi_crossbar_enable_streams(struct v4=
l2_subdev *sd,
>>                                                sink_streams);
>>               if (ret) {
>>                       dev_err(xbar->isi->dev,
>> -                             "failed to %s streams 0x%llx on '%s':%u: %=
d\n",
>> -                             "enable", sink_streams, remote_sd->name,
>> -                             remote_pad, ret);
>> +                             "failed to enable streams 0x%llx on '%s':%=
u: %d\n",
>> +                             sink_streams, remote_sd->name, remote_pad,=
 ret);
>>                       mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
>>                       return ret;
>>               }
>> @@ -392,9 +391,8 @@ static int mxc_isi_crossbar_disable_streams(struct v=
4l2_subdev *sd,
>>                                                 sink_streams);
>>               if (ret)
>>                       dev_err(xbar->isi->dev,
>> -                             "failed to %s streams 0x%llx on '%s':%u: %=
d\n",
>> -                             "disable", sink_streams, remote_sd->name,
>> -                             remote_pad, ret);
>> +                             "failed to disable streams 0x%llx on '%s':=
%u: %d\n",
>> +                             sink_streams, remote_sd->name, remote_pad,=
 ret);

It appears the current code saves (in my default build) 8 bytes of
memory, at the cost of readability and inability to search with grep:

Current:
Name          Size      File off
.text         00000bf4  00000040
.data         00000000  00000c34
.rodata.str1.8 000001b8 00000c38
__jump_table  00000030  00000df0
.rodata       000001b8  00000e20

With patch:
Name          Size      File off
.text         00000bd4  00000040
.data         00000000  00000c14
.rodata.str1.8 000001e0 00000c18
__jump_table  00000030  00000df8
.rodata       000001b8  00000e28

Built as a module it doesn't even save that - the number of pages stays
the same.

Just FYI.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

