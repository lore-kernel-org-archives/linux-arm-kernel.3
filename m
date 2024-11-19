Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CABD44141
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4EERbWf+tNb39pmHBN5FMOodac7gvgp3/YRQaVUVFw=; b=myrrpTDlfdI5w1a1E9hcGKUJel
	f6zT2GNpsHA8V6iwsaiFvgd/dhKiLJLOUl6FuTkelWvmzw+u7Oo/XZB5TE/yHvJx0X5qCHEMK5tlx
	ru1bxQBVHAvUt5+DK/mH8rb1eHR4iLRVsZAWI8XHoc/sPGeHDWPSWgJtApQTHbppXBop+ovE9zbXx
	vHhLxEX+nYdSljIEeikdWCsyAfifXbqb/pPI2efSPkohwR/+KZhJWg7OozyDEXYt2ejfCvdM2Xtax
	5N0PPEJ1Kz+WdLkpThRhyXBKQa4naFIL7majWNkNma5Dx7dwtx64ICjtw7b5YxdqyATu1CZfSnCkH
	l/FkxUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDM1G-0000000C9v5-1WKy;
	Tue, 19 Nov 2024 11:03:42 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDM0J-0000000C9gU-3jVG;
	Tue, 19 Nov 2024 11:02:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1732014158; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JpbNWO2S0DYM4KQM5jhFKm9aDqOnS1/bBXm2Rma7kdxv6xaAj81D5igv4QsIvgM6pi36V7N25hZDk4sYYDE9qThsehQOnc57LyBK9d9Le/ZUnw0ee1efWhqblpn05yUHWMPYOw5Be8qZhhjmmsiyNPwUm1ux3C20X/+zq12FQs8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732014158; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B4EERbWf+tNb39pmHBN5FMOodac7gvgp3/YRQaVUVFw=; 
	b=ZikEhzYsqIsF4/9NRHE4nF2LsYZDPPNTDr+NEAzyLpw1xm5233/Qbp8dPS0aSfg7d7yq2b3m7Uo5KSdX/SFQreHAMpqVYJ+jTiZ/4IlXNPESuhpYr8SyiIpsq48YTHqNZldWKjZF7LsM2Y+LtK6LGKCih6cc/89sTFAsIwupVvk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732014158;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=B4EERbWf+tNb39pmHBN5FMOodac7gvgp3/YRQaVUVFw=;
	b=ZoqYUmXkfrdvq11oc3VWeR2fUxq1YlBQ7ErRVQwhMvyIECXA4dfCqJfCP67XcQ9l
	MUrikgJgMgjuFyUy7U9uYXzr0ij4yfG2LQOayMNtko8crZsOFCCTUZKlccjQ1czXiQt
	LVPuFNdNLpCI2O9IO/V02MeDCX2sHoTSZmgBzgqY=
Received: by mx.zohomail.com with SMTPS id 1732014156496249.50679082277054;
	Tue, 19 Nov 2024 03:02:36 -0800 (PST)
Date: Tue, 19 Nov 2024 12:02:26 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: mark
 vdec_vp9_slice_map_counts_eob_coef noinline
Message-ID: <20241119110226.dbd54clp46klvjl5@basti-XPS-13-9310>
References: <20241018151448.3694052-1-arnd@kernel.org>
 <20241118200641.GA768549@thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241118200641.GA768549@thelio-3990X>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_030243_978067_1AFF550D 
X-CRM114-Status: GOOD (  19.41  )
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

Hey Nathan,

On 18.11.2024 13:06, Nathan Chancellor wrote:
>On Fri, Oct 18, 2024 at 03:14:42PM +0000, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> With KASAN enabled, clang fails to optimize the inline version of
>> vdec_vp9_slice_map_counts_eob_coef() properly, leading to kilobytes
>> of temporary values spilled to the stack:
>>
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1526:12: error: stack frame size (2160) exceeds limit (2048) in 'vdec_vp9_slice_update_prob' [-Werror,-Wframe-larger-than]
>>
>> This seems to affect all versions of clang including the latest (clang-20),
>> but the degree of stack overhead is different per release.
>>
>> Marking the function as noinline_for_stack is harmless here and avoids
>> the problem completely.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>Unfortunately, I have seen no moment on my upstream report and this
>warning is breaking allmodconfig builds because of -Werror. Can this be
>applied as a workaround for now (preferrably with a Cc: stable on it)?
>
>Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I'll handle it asap, it will be part of 6.13

Regards,
Sebastian

>
>> ---
>> I have not come to a conclusion on how exactly clang fails to do this
>> right, but can provide the .config and/or preprocessed source files
>> and command line if we think this should be fixed in clang.
>> ---
>>  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c         | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> index eea709d93820..47c302745c1d 100644
>> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> @@ -1188,7 +1188,8 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
>>  	return ret;
>>  }
>>
>> -static
>> +/* clang stack usage explodes if this is inlined */
>> +static noinline_for_stack
>>  void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j, unsigned int k,
>>  					struct vdec_vp9_slice_frame_counts *counts,
>>  					struct v4l2_vp9_frame_symbol_counts *counts_helper)
>> --
>> 2.39.5
>>
>

