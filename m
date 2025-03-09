Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEFAC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/1jIfL/amxl30yahWJs6fZX7UVl88swWfGechIupac=; b=YRD3NKAma+0Vfzs2W7j44iWOTD
	J3+4YbSCp6OpMrT7nL2Gd5wqkWqZWb19T0KRCDcL9TZotCf5bp86c2aTz+DKwTzTK3F+tOq74j0ss
	jTLzMcBz1vx73YvqGNreIBf3vmcZVUmznHXYqAHfP3KRSzEJ5N01IVXpT8AFOO21H2pU7Ap/MJKhs
	sInp68cTVucBZA65CKp8vk15HFdiwPuz0aR7v0IXkWnIa4BBb8OFjZs9uUxFO2Jte+Eqr5ZsuQIFv
	W8HdATZc4BdQxQoEjItRqzzn8nTi7ggixN/Zs222T6wW4EsXvTQC1grzD+Rv/XzOGMwK9gIzYIZbg
	+jecHg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trDzH-00000000NHb-0cp1;
	Sun, 09 Mar 2025 10:34:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trDxd-00000000MxP-2ybY;
	Sun, 09 Mar 2025 10:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741516364;
	bh=JNrhIUCl8uKi2zGaj3/5wmGyxr3eXLSdAcYya8I097M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eOvl5QjfMn0ehXW+yjOg/C2Wlgqm5TwbMy8zOJDl4wTd/8N7s+YDpdtaCY2noon17
	 5DscJYUNLrxlNDs4AXY9GkJ8pYGtfTDT7qQbkKv8Ke+mAbJVY9f8T4qym3Cgegs/S2
	 Sy7nrsPvVd24Y2eYIUHmwXOZR9UHr+UPtXsii1HZBZHLDvwqQprA3qkC00UViMdIhl
	 VrlTrqe5GPMDQl7Mxn7nqUOokkYsCCkdWazQ3g+NoRVWw8E0TXnLyS/Yw8HViy16iq
	 ZUFaBxRe2WjHvgJbK8M0OdT+Vnu0cGblpGUps9EDZErep6nQnnyZhO6Uk7RlM5XCcV
	 sH+BDFEXL8kwg==
Received: from [192.168.1.90] (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8025817E05C1;
	Sun,  9 Mar 2025 11:32:43 +0100 (CET)
Message-ID: <884acd6e-4936-4b00-88ed-cbccc10efc9c@collabora.com>
Date: Sun, 9 Mar 2025 12:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/12] phy: rockchip: samsung-hdptx: Optimize internal
 rate handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
 <20250308-phy-sam-hdptx-bpc-v5-11-35087287f9d1@collabora.com>
 <CAA8EJpqzZaRoQ5mDeKUHpNhYsegC=V6c2SQpKaQn4FYhozQn1A@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAA8EJpqzZaRoQ5mDeKUHpNhYsegC=V6c2SQpKaQn4FYhozQn1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_033245_932697_524520E9 
X-CRM114-Status: GOOD (  13.28  )
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

On 3/9/25 12:17 PM, Dmitry Baryshkov wrote:
> On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> Drop the rate parameter from a bunch of internal helpers and, instead,
>> make better use of the newly introduced ->hdmi_cfg.tmds_char_rate driver
>> data.
>>
>> Additionally, rename the rather ambiguous ->rate member of struct
>> rk_hdptx_phy to ->hw_rate and ensure rk_hdptx_ropll_tmds_cmn_config()
> 
> Would it be better to name it tmds_char_rate?

This is only used in rk_hdptx_phy_clk_recalc_rate() to provide the
actual rate programmed in hardware, hence the "hw_rate" naming.
Renaming it to tmds_char_rate might add some confusion with the similar
one in ->hdmi_cfg, but I don't really have any strong preference here.

>> updates it only after all the other operations have been successful.
> 
> Please don't mix refactoring / renames and the actual code changes.

Right, I should have moved that to a dedicated patch.  Will handle in
the next revision.

Thanks,
Cristian

