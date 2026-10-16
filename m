Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C5DCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKpnb7yXuWN79+CT5JC4DKumb3SvQ4AMvlQXBzXMP+M=; b=n1bdlg8eqJP3pkEdEU/4iTDQ88
	6EUxkvjmVwgQztcxLH8fKAcia5MkRRCGFaB1te+iKB4tGPm4lK2xuz4195fx2QYhQ4rbVEQq2fGW6
	/HrJOR3lt+szhMsU9DDKs7viP/cEUuhVOv2AA/5MlV7fUD6tcOGivV9Nzd6CTAAqg1gmQDzR0REbM
	WjbrXIU5EabQD2+eHHLaxy3HE6YvVivU58jLp29UYJaZ1XA3yUWQ7lPBmam0VtfP/FFgWXU5MyrU0
	KlOX6b/f47qt0taPwLiUoLkvsi7I44gNWJoGkqjaXKfV9eBnnIGBQKDcmo6R37Mzy/0tH8/srZLe0
	2z9M94iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj8n-00000003BR2-0FUj;
	Fri, 16 Oct 2026 14:42:37 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj8f-00000003BLU-3ZIl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:42:31 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 3D02AEC0038
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 10:42:28 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 16 Oct 2026 10:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792161744;
	 x=1792248144; bh=aKpnb7yXuWN79+CT5JC4DKumb3SvQ4AMvlQXBzXMP+M=; b=
	V8PPXjMs0B4JLEonkN+/l4V+KmdgVisapme+D4QH/aGw2aL3CKGOL8e0fPYGutdq
	wnSTTsR0DzK/y1Z6hAHJrE7z8e8yilGlTKCYsYl3iw8Id85p27nsE1854z5ZKd3l
	UoGPdjeF9uHeMvGWG4JSrjmht5J6u/4PNsziIeCZDpQ4s0s/uvpMAs8fDgdaj7xl
	oHCaFeJsuc640hOvysj/4+wPWRqMawEDbMwGv2dNfS9tbHDsOfb53aUkmC2QsyQD
	DKi5TFNzDqLYGj6yh0CIDLjxKK2j13tSBsTG/lTH6nKq3OQKYsmR1xPxS9MAGyWj
	ySxVnI8WVrs+vYQJWJSGxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792161744; x=
	1792248144; bh=aKpnb7yXuWN79+CT5JC4DKumb3SvQ4AMvlQXBzXMP+M=; b=a
	9Zs3sm4I76Vaj5D6gQON7Vx6K4rcAflIUWoxzAZpFk7qPRtBn1fJgfVJ5NqwMh1w
	bT/j5grxJRoDMItroh9/WZZwTe9vwhdUpsoDPEpfVynaD0NMY39hLTms5w1GD5tI
	Y5mV0xNGmtN+aBHZH9Bn3NeONPRwl/LLc7EEhH8sh8nLfKVp3SgAXoMmTV7Qpt9r
	hCI+Vs1/B1WKKy9I0fxBuqzAbV5o20XEA4FLhvMtRkWLyBGMNjpUGzWMjU6jnFMQ
	3bP/YcP72IPuZUaP76bXdaYn22oyqllcPMZoL1/6Z3BBEt9oMFOQQp+rDBSkrIWP
	PRWjTNIsTUwLed6INZaWw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792161744; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:l1ZzzmcpvKxgm+No6VsvM6vP+zquHoYoJv1EAMtquLBz9Co
	oNFNHXQHS6m5w2hue5L4iyOTPyNXlkjBTiKNIHWD65om0XrEVaYCHn/ux3moySVt
	KFvufdug53RAvDkzRhVDZzjA2yqL4uKySlOhtn492fcEUkk83a41v2jtONHWHXqh
	5G71jZ1dl30Kfe10/3VD10YS3RysWAYC+VBMpnZ30Y+CkBNI7l5YH9MyIitNqMBK
	JcpN+L1ajNHwHk84VETr2Fk9PtqIT3j8MQpyrQPdt3Wlq9F5sFrG7xTemPoCQuxo
	mW9mvD+gN2aGU3xqKv2cm7SN8jfzM1IZX+INmvw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:517RQdKwcZ2E9HUT6oL098gqiwhapSKZVShqyWaxe/s=:+nc4F9eQckj7R90Z9Q2QAGsijSxI7+KgudcWTIBAlmg=;
X-ME-Sender: <xms:yzfSavWKk1CWdiXw8r5FzOYTFtgxgqNYCIKultGgH9-tltZJS8QZ7Q>
    <xme:yzfSaiYcFUmqFhP3QgSplPucIvjUaZznOayAqtrHDxZ5tqdQJdzAn2nHLVvsfyKfz
    fDN4q3F_BkwHyrIRYKtn0FjUYinJU0azr8k1pRN8Pk8a76CQ0X2QA8T2Q>
X-ME-Proxy-Cause: dmFkZTF+3rfSvQkPH5vX+1X2huUFhfjyJS4C9bKeG9uGBVPWuaVR0D3ZOB7E78/lg6lBuU
    yeBeDN3khuVjziy4hSwH9Df2QVhA0Xv5BaQrEJmvPDOP3bk2IIb77+jIifD9y5gHsoM6uH
    0BpA3/U3YMURqaIU3ydySEv5DU07I/Jq0t5sA7PZhzNG/2Y0PDb+t3LFZAmaAD5CebEXhF
    aKhfQfmsQWHms8hnZM06bYRxMF0H3s5kZnDarIoMXepYLKKjDvRkeZdTj7d/WZ1kjLRsWj
    khDmaG7O5INuZPg/R2wbe6iKf7de5mIwuPeBJAn5JcJO+0tSKulsLV5NSZBtSIfdJjTTk5
    olmJOdht7R5yTejFZHBHUB9g6WzTtvOi/zkP63dRWIc6dsUGD7WGwk1Q3JfA7Axsayc8L9
    gIFNTGForC1WFBhK8RxKPPSVFfP/K9wZZ7lVIbRhUtVXiYlyNgtb89JNlKSeaUhqyMsrns
    WNirtWw2o5aLwlNXNu7Bijbt1wX/2zTPZUDpBw6G2Co4QALkUsn0f+w0pdT8wZv5kGMpji
    cyEnkjEHMalCTDmSMX9n+izdpCFFIzZXCElzfy5sWo4vJm2buslxecJgKRv7R9TbcQTwW/
    1qEgRPGeFhuCW5t414ga+l5N7kd9eF5PU8pBlfqTAQwjXVZhP8eOlCDNs5hg
X-ME-Proxy: <xmx:zTfSam7umEVih8a4--NQmF-q0lwAH6Fr1UyW46AQFqENdv7HVBbRiA>
    <xmx:zTfSarwroTDoX6Lc1tXnVi4_ZYKYGPziuDSlyLyfPNBv3mZmjQCyTw>
    <xmx:zTfSaieiBasoGJWfcs8R-MyABsbCqWo_hUa-NNOLOUbebiIUEvPfZw>
    <xmx:zTfSaoB_OuzJ4sZYoFis-zvJp8bGgMDz0LmIdb9Ji7OJn3-_025LVw>
    <xmx:0DfSaiI0VNjCYk10DjPyPdQ372pfkfhUVI0srhoHy_PJQoP8GzEpKklL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A5F3C32A008E; Fri, 16 Oct 2026 10:42:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A4WN0AQLOakc
Date: Fri, 16 Oct 2026 16:41:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
Message-Id: <912aecf9-b135-48fb-b539-52ba3a1704a1@app.fastmail.com>
In-Reply-To: <atImm4Ixv_PwUqLb@ashevche-desk.local>
References: <20261016130328.1037616-1-arnd@kernel.org>
 <atImm4Ixv_PwUqLb@ashevche-desk.local>
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074230_183744_ECF6D10F 
X-CRM114-Status: GOOD (  11.47  )
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

On Fri, Oct 16, 2026, at 15:28, Andy Shevchenko wrote:
> On Fri, Oct 16, 2026 at 02:59:47PM +0200, Arnd Bergmann wrote:
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> But there are some minor issues to fix, see below.
>
> ...
>
>>  {
>>  	unsigned long old_iobase, old_mapbase;
>> -	unsigned int old_type, old_iotype, old_hub6, old_shift;
>> +	unsigned int old_type, old_iotype, old_shift;
>
> Move it line up, so we will have reversed xmas tree order.
>
> ...
>
>> +	/* hub6 is no longer support */
>> +        if (new_info->hub6 != 0)
>> +                return -EINVAL;
>
> Please, fix the indentation, should use tabs.

Fixed both, and the typo in the comment here, thanks
for the review!

    Arnd 

