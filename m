Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E954AC55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 09:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbmJlLA3q3nQT7gHesv0aQMb+y3lROiAZrmQ+DGtwCU=; b=guZtHPQkgoRl6cZoriLUe8ErMK
	onw/fgzWmctmJIZ+3nk0NLy3LlcRUD5VkRSgKvI+20dIABss1Rgpkp5uZqSevhpeoEtU21QPgwOUv
	rMTQtx0SdR3tpQTc5i8rs9okm9CzKS3OXaiKKIUngpMc1hRvYTJXXSJ2u8VKmrm+ALo/DlIXjw7Kh
	7B5wcBy57tJ99WYmJyJTl+b//c1GyfmzJPn0MD7AcxtC47PGNGoUXjb2Uz2xwl33+JfcLDFFk8cnz
	4WIZ/3mYEHv2ZsM9b7Q/nnXiU9jXHXU5ygHrIOY9HdQLiROATkQS1iWG5Hv9xHH01LWutRkYeRPgp
	t6fZr3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjrg-0000000CE6i-0D6x;
	Fri, 31 Jul 2026 09:49:16 +0000
Received: from send105.i.mail.ru ([89.221.237.200])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjrd-0000000CE5p-1YPz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 09:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References
	:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:To:Cc:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=rbmJlLA3q3nQT7gHesv0aQMb+y3lROiAZrmQ+DGtwCU=; t=1785491353; x=1785581353; 
	b=lBSOudc9xEnOd25d2W0j6r2uT7J/2/kJMpXZupOzAwSeaTsGFH2bbIIfK42f2ItWIRVB3rehjDr
	mESjJ/AYnS+dRTkWztyddA/fC7dmTtNWFBCutY9Vjef/etEFHfB5cn2bymEdYXbTN1BqFqt3oNE48
	8Wx0XTNzshoPDKwKI+uJ4FemP8E9WenAO1z9zfAwmAi4zjHUeG3bkgW4EHGJckOhkF4BetGzf6KSr
	oskrJwfEhH5AsaQNiuObnC5gtZ1xqpdUKfF7oDzApkZNdJip5wyFfBkOwtfQDlv9BEl4C6hH4UM9T
	fOJW21Lj6wGWa4ZuWpLm0UIo41rOeUrakCIg==;
Received: by exim-smtp-7f4897b4d8-sdvfx with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1wpjrT-00000000CKv-3y9d; Fri, 31 Jul 2026 12:49:05 +0300
Message-ID: <eeded0ae-2373-4f4c-916b-fc7ef69d1181@inbox.ru>
Date: Fri, 31 Jul 2026 12:49:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qe: check platform_driver_register() in
 qe_ic_of_init()
To: Linkai Gong <gonglinkai@kylinos.cn>, Qiang Zhao <qiang.zhao@nxp.com>,
 Christophe Leroy <chleroy@kernel.org>
Cc: Li Yang <leoyang.li@nxp.com>, Saravana Kannan <saravanak@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260731094608.1883391-1-gonglinkai@kylinos.cn>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20260731094608.1883391-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: exim-smtp-7f4897b4d8-sdvfx; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9DFD0580A18F85590CECAA203DE555ADC8ADBF53EAE2F439F182A05F53808504043A30FDA614BD1E53DE06ABAFEAF6705D13E1232761ECEED5A7357720D433CC0FC108E89ABB85EB9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B9D6DADD6B53929DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC83A81C8FD4AD23D82A6BABE6F325AC2E85FA5F3EDFCBAA7353EFBB553375663F17BEB63674488660C219CB252CB0048386F7D7E49B163DB0D8299AED515A848EEF46B7454FC60B9742502CCDD46D0DFE4D9CDE3FF759CFF6B57BC7E64490618DEB871D839B73339E8FC8737B5C22494854413538E1713FCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C0A3E989B1926288338941B15DA834481F9449624AB7ADAF372E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3335407143AA9223635872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A50C39E6D6EF5E25495002B1117B3ED696E9C16A86A627A6650E58516B1639A14B823CB91A9FED034534781492E4B8EEAD37F46C620FF2CAEEBDAD6C7F3747799A
X-C8649E89: 1C3962B70DF3F0AD73CAD6646DEDE191716CD42B3DD1D34C77DD89D51EBB774225B6776AC983F447FC0B9F89525902EE6F57B2FD27647F25E66C117BDB76D6595D1FD8CAF8722B1002B0D202F763F675C0D2A39E2DE76B6CFC2FB42B26F389790ADDBEB1EC8FC7FBB8341EE9D5BE9A0A76F26694F9F914075F9CEEA7BFDACB1FA6981F0E138A44E239A4D55D2591C6014C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVczkDsfooUjf2LE7naJC7AQ=
X-Mailru-Sender: 689FA8AB762F7393520AF17B8A65FDE2630AB746A780DCB0BC4FCA5E43424B5667FF164975FC828890DE4A6105A3658D481B2AED7BCCC0A49AE3A01A4DD0D55C6C99E19F044156F45FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_024913_773112_C5B5865F 
X-CRM114-Status: UNSURE (   4.48  )
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

31.07.2026 12:46, Linkai Gong wrote:
> qe_ic_of_init() ignored the return value of platform_driver_register()
> and always returned success. Propagate the error to the initcall.
> 
> Fixes: be7ecbd240b2 ("soc: fsl: qe: convert QE interrupt controller to platform_device")
> Signed-off-by: Linkai Gong <gonglinkai@kylinos.cn>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>



