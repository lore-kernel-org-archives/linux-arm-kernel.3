Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A33C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rrZDi/1EjBdvKW+kv2HMdm28Hq+XHxEyJouFf8RPN0=; b=Cnuw1CL6u05m0MciJrZKIXmfuE
	u/iYfYNkKRfw7CKQYpZI7xJkEQipqBbfoeGtMchsgJaz0KWHyqw776Tt1N2zot6xNn00GGKXYFi53
	RLp6sZqgdyBDD4WVq1PvCISL/jgxjqu1zZ/36X9HIY5CVUVCnIKlZW6tE1eqkLC22K/grZXmSVjx9
	Df7zzSF6cnY4tOkZcZHmRS31jg3lSEclcgFJ8A5+HRAF3lfZ15rllXllMvxyJLoNB8n3RGlD1EMlu
	F119ZXgYZ2ZMC98LMjIk7vtp0wMvDfYFykIIdjGM6pMPIojOU1Z7yyt/jcgXnsnsWJhz+/yVRhdSp
	rLpiBbgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trDqF-00000000MEM-26Sx;
	Sun, 09 Mar 2025 10:25:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trDj3-00000000LJH-11Gk;
	Sun, 09 Mar 2025 10:17:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741515459;
	bh=a9ZjEQJCPX7OdmrFZfTFLcOSWucp97wa0eLCzSNjgwg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jvwKJxkMx/ByKyXBNBK+i8lUNXRVXN2/9NOJ5FIU4+qitYuEAjgk9XHX4hTeUZMDd
	 dvW+OMApYkM5UlJJL8YZm9RPUrAS+JnhndtyZ9B1HV7Si1skqHRifyYpiLzwJUuDuH
	 SinPFa9jSA+4v6G9t7swwcDTPRzVpfPnFOkfKgkdTF1h0RpbQkAmEyXrmWvre/Lg3Z
	 ej4XQbzdS2B2mo7LL0BE4ywCPbIN52O9H1ZOFgr7G8sWIDSE48Lgdl7IjN2xtT53PY
	 gPODhO07J0ktW8WPeDqqLfl7H51yC45pQgRldMGav/QXr1r+76T83EPLkOXR/jznYF
	 GEVBOMTA4m8PQ==
Received: from [192.168.1.90] (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B49D17E0343;
	Sun,  9 Mar 2025 11:17:39 +0100 (CET)
Message-ID: <f7fdf5de-90aa-4753-9500-c30339545adf@collabora.com>
Date: Sun, 9 Mar 2025 12:17:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/12] phy: rockchip: samsung-hdptx: Fix clock ratio
 setup
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
 <20250308-phy-sam-hdptx-bpc-v5-3-35087287f9d1@collabora.com>
 <CAA8EJprBcGz0tZ5SDVC_WK2bzjXZAtOj+LfGnSxmwktvaQw=VQ@mail.gmail.com>
 <f1e33b02-5646-4219-98ac-c09e31d8215b@collabora.com>
 <CAA8EJprNTUuOwu__GcRhYmNi5rT0+3r16fs+n7Gdy3sjgTp+nw@mail.gmail.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <CAA8EJprNTUuOwu__GcRhYmNi5rT0+3r16fs+n7Gdy3sjgTp+nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_031741_434001_83BE7C61 
X-CRM114-Status: GOOD (  11.21  )
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

On 3/9/25 12:12 PM, Dmitry Baryshkov wrote:
> On Sun, 9 Mar 2025 at 12:11, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> On 3/9/25 11:17 AM, Dmitry Baryshkov wrote:
>>> On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
>>> <cristian.ciocaltea@collabora.com> wrote:
>>>>
>>>> The switch from 1/10 to 1/40 clock ratio must happen when exceeding the
>>>> 340 MHz rate limit of HDMI 1.4, i.e. when entering the HDMI 2.0 domain,
>>>> and not before.
>>>
>>> Am I correct that the only functional change is a switch from
>>> greater-or-equal to simple greater?
>>
>> Yes.
> 
> If you were to repost the series for any reason, could you please
> spell that explicitly in the commit message. If not, it's fine.

Sure, I'll handle it in v6.

> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks,
Cristian
 


