Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ACEC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=py27cKq/Z/V1rVX8S4fKDBW+vusbu4GPYTaG3389O00=; b=iV/Z5tjwr7ZvJ/BKJAYLl8YQyS
	a43WL2RtBHuMUM4x2/V8Z7hjssMikfRT8vNQL/ysBVZqOR6XE59E/4BtlYXjN/cvHQoBjoE5Rkjwv
	HmmNab2iOutVz9m3Y+GnSSfnjatNsKcgNz8Q4R7+zP/pCHsZ/lXl4dWlBJh3b5giqJ5iD3Ur43H84
	LFWe0HMxkMlWsZ/IznD5IGuv19Ipg7Wg45G/s4PEk9qDbEyibtO7+k6drpXTvEBV3iNxHVmCFoOHY
	bPCmxFx0kHkW4txfzdYxxx6gHrbeqd+0KwcstqPi/Y+6xdTqZJnt7spPvL/Au7qFgohTz8cXGiJer
	shZ2nUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trDgd-00000000L2n-3Go1;
	Sun, 09 Mar 2025 10:15:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trDcq-00000000KbU-3gqE;
	Sun, 09 Mar 2025 10:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741515075;
	bh=sQra10c30MYmky155tTp0EkDPmDnARSe2sYZR6ySckU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RHKbmtlj+KMHs2L793B6DvggLvnoRIlmnAfp8wcnileSwLHbHLAI9+B/HeGN/0uLw
	 2M1R4e8y6tG9LwnZ1ya6kVOzmldLzlMZMnogOXmmW+ZJCSz+liqVd5JwYCUZ2eZGep
	 ZnZ7h6PUuVENMBtL0BfC5kskKjRLi70qfJ9eIe1aSQbU0hCl8yDWI0nXIiTiSecc1B
	 yl2z5bKSQDgwaleDLirXARJN9ljEsofhUdc8AnZPMuuG8LnMBBVAT4wfOSbcDxsDfx
	 X9QlgTtZFZ8TI4ta0rhpna3gn7bFZlGGd48U0ZMO874Wt/MlibrKI3seqszUz9MM80
	 3hmDBhbizPr5Q==
Received: from [192.168.1.90] (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C052317E05C1;
	Sun,  9 Mar 2025 11:11:14 +0100 (CET)
Message-ID: <f1e33b02-5646-4219-98ac-c09e31d8215b@collabora.com>
Date: Sun, 9 Mar 2025 12:11:13 +0200
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
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <CAA8EJprBcGz0tZ5SDVC_WK2bzjXZAtOj+LfGnSxmwktvaQw=VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_031117_070527_B0A27440 
X-CRM114-Status: UNSURE (   9.06  )
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

On 3/9/25 11:17 AM, Dmitry Baryshkov wrote:
> On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> The switch from 1/10 to 1/40 clock ratio must happen when exceeding the
>> 340 MHz rate limit of HDMI 1.4, i.e. when entering the HDMI 2.0 domain,
>> and not before.
> 
> Am I correct that the only functional change is a switch from
> greater-or-equal to simple greater?

Yes.

