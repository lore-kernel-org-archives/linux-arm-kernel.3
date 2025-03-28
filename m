Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59B1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 10:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsTjFY2jj2A4o4aQeM1yn18m5VjBspLLRgGpCLGwkew=; b=eTn9XjtEk7byLgkJkwy+n7GZiy
	HrwSe18TIHxO1iO0VBNzzm1W+5EY54JZjbnWAVdnsEUok7E/hudhYTXJA2LT9xa7ObILCm1kUIVzV
	157m4NLF477F1uM2OnnfEzDU6ez8whRNwIqnSb1DEdJOMeU8844ub4dNbrU+3HElZMxdfyu0GWOOL
	acGYw/j4TCLlTp0ohRcV7gSLWV/lPF0AF6zqHsh+3NUUktITsA/5RnYlM/Cjdnd2h6tJ603201jfd
	NSUB9fFUeHgu+17xcG/TNT0AOqO33TV9dzX+vKEpX4CgZ5pvDWRx4geCHIxmrKEIg2oX3tw3QjYNN
	JwhbGO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty7QP-0000000DBc4-2ose;
	Fri, 28 Mar 2025 10:58:57 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty7Oe-0000000DBUn-0PBw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743159403; x=1743764203; i=markus.elfring@web.de;
	bh=BsTjFY2jj2A4o4aQeM1yn18m5VjBspLLRgGpCLGwkew=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WpDGO+e8Pafgapt3mOamCiKLPrbULpkroAnOl9ooxFPHR/fNPkuOhNO9D+NtGlSc
	 xwKVjPgp4XRZD4AwPykZImwZC2GGBlimJl1TBZHurMmiQ/5Qpeo7FwZW84LXuqYV5
	 RXzHRoMTgT9gPICdplbHT/gZPUknsuCrQe1eQ0jsiNjiKL8Gh1C4Qcoh0Lh44EePv
	 M1vZoKHqe/CTPjYmOv9mCUEpvI5z/+s0PXnQXuDfyC0HDAil/oRTCYT6BTzMa23hC
	 WskAS67FlspXcYxb3ZBtukPpU5uvgs9985JRjjvOYQ7YRCUyepj1u/fOKDMwC0lZH
	 ougAWFN2c0fEYLUkzg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MD5jv-1tpd3y19nd-008p2m; Fri, 28
 Mar 2025 11:56:43 +0100
Message-ID: <4a17d0e2-bed9-43e5-a867-a501b991e6e7@web.de>
Date: Fri, 28 Mar 2025 11:56:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250327231146.6388-1-qasdev00@gmail.com>
Subject: Re: [PATCH] HID: thrustmaster: fix memory leak in
 thrustmaster_interrupts()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250327231146.6388-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8213H3JxfzTQowCs9fcHxElSgWiDoD0E+Gg1w0tPtaSuYYTPPy9
 Kja4WkXD0/LkPpj/SAN+o1cRvBrVIFNXeNoKNsCMK0WjzCgs3YKslikuiI0UZx13eRX9MH4
 jqCUzTqRMrmmV3twB+FRXb44dbQdb+GtVqlJTGwT8h6V67i1S3QRaZiQZPatWV3J3cC5g+f
 8NkN62sPnQKhAE8Z1UPvQ==
UI-OutboundReport: notjunk:1;M01:P0:+fwmZpPe2Zw=;w07p3cdLwi1BKzk99WXBuwFWIa5
 DCS74iZOzPB9xdCYFqGs0rThXtHxIFybDbMmhw/OG6CirzS79/QbgubWy8g75m5489HRYJW5O
 Ncjs/2cwJsldbhl4KkJElVIWNqN5EITI10GrD/eylok90s9KQC/VkFnmmacq21ErL1y2Kojo8
 +aiXIglCI0rFA4w+9LjIr7u7n7UmWk9O3TpxNippid/G+i+H9By1I7rG5AkzgP2Muxv32I+6v
 X9W6HTH+dRQrkVJW+f5YxZ/XW73Jf0yFxvIIbzA5VrwO43GFJhmPbxcFRQcYyT51dgwXLZWFw
 qA8ppHE6tPTiIE4T5+DhKeqhnvWzlIXFQkI6Md3vhLOea0/Z8fDwLY3t8eS9zBBomD2vOUTlI
 WgwP2DnbN8tkQFsvZDoB0D//ucMFswJ7c30GSlR4FrvTPCNDdHMnZxkransQC5jURDrRHdllM
 jTb8udFVCbhxNgNJf/ke/bRSjHfav4itVJuFUDBdeyUWhe47KPBYyPpx3K4M5xoD1/YSmjOIG
 76bbnDhZlWNygnAXgPRhJAF5/Oa0y4B/gmORF3l6njcPUoxzUXApDPsdRa4KZ+O3EwFCNAGD3
 cTGsAqMv8ceJQbViT1clB3i0u8wYrd6zIVZ+KIYa38ZW49uqMcWJPZVYNodwhcqXbmqzqLw2m
 /37ayWoiMt1uzjORW+PEbeHl5g6M0H+3WMdDCih1HG9oPE9TucBVcCmseAXFsuG+iOWb2kPAQ
 o9AF9qRXBLvNvCP7bIOOnRgz5DgM4Iflb815VUMd0Cls0TGy5wFsAxPQEDI19gb54R1v6r9tD
 ngQmac0FpdZzYRcoAB5Zp9CuXE7oWOyr2i6Fy8lahJciqxGKW9jTyf3fzSHPoe1NK1OR9BPqz
 HW8DDJwQsPv+8UpmAG8emYw/80uBhnRo0/rWzPe4b5fDiBg9mU9fz0qeWBxJlOJgHcWhwDO76
 s/kgQlq41QPi9KUfG9rdrzFxxX56RQnYjRbS/VLgm8yMvrMSBggr8Cmu8JgiO9WR98Db2c3/2
 EFuBz8eO4h5mi0StywHTNPig6QgVg1mZFPlB4hIFBvsw+KstCM14rojQb1TFAJvVVQQIyChTt
 OHwuhS0NdOSM99lntvc2N05xI9AG+qOKKQUD50TNWylkXMcOk0l0xCrTkW1d4LceWQ+ers7c8
 WE9aVL7SvoX1oikayk23bOUHsA8ofxy96MHRyq0YQDrqXQ5WeSHLEElefy8Wn2jOLylRvBO+L
 jXLHR3gwXK4lyieiU96YfTyOmKtB3awooEhgN54U/3TJkjThRRXtogRVJT9vp6EcrPqdsAnLs
 dWNFJHDJq2lFv+eUjLEwKc/4f+vVSWAJu5piBgIb2X4q8xLfxLCujJ+gQYQFy9OHioyqxduzl
 LJq6au7bIavcDFGHr6ZhWrgCPcsPGdAkWgiBfbM10HeGrr36/fN6Egk3VjiqGSeNCvA+0SFm1
 xSgg9q/93WbnUMcBKUWZ32vRADVjKg/xxOCHJyCweia8Js6cteqAC/8hvsZgAnzZtKJ6grw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_035708_442246_BB60F5CA 
X-CRM114-Status: UNSURE (   7.16  )
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

> In thrustmaster_interrupts(), the allocated send_buf is not
> freed if the usb_check_int_endpoints() check fails, leading
> to a memory leak.
=E2=80=A6

I imagine that word wrapping can occasionally become a bit nicer
for text lines which may be longer than 59 characters.


=E2=80=A6
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -174,6 +174,7 @@ static void thrustmaster_interrupts(struct hid_devic=
e *hdev)
>  	u8 ep_addr[2] =3D {b_ep, 0};
>
>  	if (!usb_check_int_endpoints(usbif, ep_addr)) {
> +		kfree(send_buf);
>  		hid_err(hdev, "Unexpected non-int endpoint\n");
>  		return;
>  	}

* You may avoid such repeated function calls by using another label instea=
d.
  https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+=
goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resou=
rces#MEM12C.Considerusingagotochainwhenleavingafunctiononerrorwhenusingand=
releasingresources-CompliantSolution(copy_process()fromLinuxkernel)

* How do you think about to benefit any more from the application of the a=
ttribute =E2=80=9C__free=E2=80=9D?
  https://elixir.bootlin.com/linux/v6.14-rc6/source/include/linux/cleanup.=
h#L144


Regards,
Markus

