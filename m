Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5C0CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 06:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3BJdilVoM5GU6RaftGRrjnToveeVu99NI9zfibDhTk=; b=qoWAXmbn7wrRnvEGJ6rnQE420l
	rrwHwCzah+Kdosm6r+v1skbRFSg0Zhhz7WMFArWRVjJALQF9SDJn180bkfSC5cLVXUGIwO916FDbz
	pGZpD4igqlYofDYw2bZIqobbgWbwnXQuEvdNbuQrduHrLgOiJB1zMpnKY4z+QRlyMifHPWwxfBPGt
	9QxOVDTh1erzVltNtUw/oNTSK9y2k/GWj1xyiWSczjse3OYRYOIvZ1hPlEbmXPluZD7PG62QirDU5
	75SE4spiubO6bmdsUlZ0ONHrJ5YVr29l56/Uexi+s2ayge9AfDU5fCUDmEbf/VsPXvNT+Nvvexggx
	ZVhfooSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMw7-0000000FHc3-1gOX;
	Tue, 16 Jun 2026 06:06:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMw4-0000000FHbD-1BYz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 06:06:10 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso30579955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 23:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781589966; x=1782194766; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3BJdilVoM5GU6RaftGRrjnToveeVu99NI9zfibDhTk=;
        b=kZTHt3Rqilfhpoc1DfyjoFegRQPXvQro/r1E7kqYX5m0LRFiU8Fz6yIEDGNgBHLdTr
         WP2zUqTvGLrdyMaAmBTACC1qU798iO3NzQJbfBhGFjWsS1jn6Vxgk4IZExI2WP/wbriK
         yS2uaeOENsMNhkL2k5lYbz2ZoT9KkN+PvDjWFnkk5THy8KkWtb+276Xw0AYhxDQy6Hfh
         IvQKxUdezMMv4K3LULrZvFWw4zFDNQX7REQAsG9JX4J9Gyzb6YlO79V88Z3oJa1jLf2D
         UEtc3TtAUTrt3HySfNKdcVYSt6UDxNa0LdoPqCdXa9WWR6wGfN0HdEafRDv1rcKOdH/H
         3koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589966; x=1782194766;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3BJdilVoM5GU6RaftGRrjnToveeVu99NI9zfibDhTk=;
        b=DnN4ld8NOCoGsz3KdtRRhex3D3fVdMAMXz/hzJmz97kCWeVoknKLbOezEljU7VVD7G
         NFUU3xyAoEapB33+4EXpDdrUMGzi3DhJQeet7UwYzPXZjWmi/oAa5l73fB9fw3+DJps1
         EG04KdjNJ8/wVSKedn5npAw7/qr9wcc4ROsdwLLCAY8+ppDWTrDPrf7U7CHeJoUY6jMz
         D9OCW6h8aA1eTl2UnDTE3W/bDCI10qwy4bE545JQ9DQ8KUjidKgrMmAh65F9TxPZIlKT
         zApXSif2iuBnr8yt8A8IUcMyRZwTEwinNO2YW3d0s+nVK7qc/NdhXqMLhp84c9kHH7Ry
         JGiA==
X-Forwarded-Encrypted: i=1; AFNElJ/BHzeaBBA5R6lvQdVOimdjUnPAsNf+JkrqIKoARKl1nTjGzgUQKoLiircTV1uS9chTb6ZpQY86nxJ/q8+/dOW6@lists.infradead.org
X-Gm-Message-State: AOJu0YwtTYzzAkINVLgCKfROvvq2SwzloVliQDPFwslltS4Afabf9tM4
	w5Xl1pWycGgoGEL1Id9rOY2Uz9Rjdb9YMSPRaAXOzq3GFjhSKE42As8eqB3Rm56rJSk=
X-Gm-Gg: Acq92OFDtUKfygAT7ctdmnN73PKVsFOCmAIafsYwGx2taoS1X7FScJSNTSdRzJXiMql
	4A4xcaL8w1ItpJrmQCqzDHroZyhkc6dxH1Lhx3LLxM887b9ok7epT2WVb8kY7aUbN3LVt7GG1nY
	ert2+j7xV4ysakNjcpv1yzedX6ZTNO09abh6XmCSZlSph9hvqGhkEiR+KXGEgpqIgUyNVpuVtbV
	E4nYN+yVTyOsyCTieBMYvlMyott47JLDyqrviY3yIE8fbPmOlGzFm2MCox5PS4QUAvQ0TuhLcVm
	k2gNyGFYikNH6YcwXYgHy2e85U3jmleux+RwiD2CJ7BVYdpPbPEFPsJvRvafFO2P6nU24FfOH0F
	q6A3M0mCwjObRicJlb2PTvG/7FgKnMyACxRCBatpiXkkBqwqcxQvwu1jBZIKw7IgLthqVNFQJuA
	B8UgVYZFpENJ3CWiGzClq/0XdedY8Zd3Mt
X-Received: by 2002:a05:600c:46cf:b0:490:b6a4:9f43 with SMTP id 5b1f17b1804b1-4922ff8ee49mr30603825e9.7.1781589964995;
        Mon, 15 Jun 2026 23:06:04 -0700 (PDT)
Received: from [172.20.10.3] ([37.167.70.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa891acsm51925935e9.9.2026.06.15.23.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 23:06:04 -0700 (PDT)
Message-ID: <b2d8cb85-5529-4a4c-a233-64ca7a436f0b@linaro.org>
Date: Tue, 16 Jun 2026 08:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] PCI: meson: Fix PERST# timing by asserting reset before
 LTSSM enable
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Gowtham Kudupudi <gowtham@ferryfair.com>
Cc: robh@kernel.org, bhelgaas@google.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 yue.wang@Amlogic.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org
References: <20260614015620.20432-1-gowtham@ferryfair.com>
 <84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <84cc8b0c-da06-4d01-a076-9743c29c91f6@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_230608_369196_A85C556D 
X-CRM114-Status: GOOD (  18.53  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 6/15/26 12:34, Ronald Claveau wrote:
> On 6/14/26 3:56 AM, Gowtham Kudupudi wrote:
>> On warm reboot, the PCIe controller's LTSSM starts link training
>> immediately if PERST# is already deasserted from the previous boot.
>> The driver then pulses PERST# for only 500us, which is too short to
>> properly reset the endpoint device that has already started training.
>>
>> Fix by moving the PERST# assert/deassert pulse BEFORE enabling LTSSM,
>> so the endpoint gets a clean reset cycle before link training begins.
>>
>> This was found on Amlogic G12B (A311D) with NVMe on an M.2 slot.
>> Cold boot worked because POR held PERST# low; warm reboot did not.
>> The fix was confirmed on a Banana Pi CM4 with Waveshare IO base board.
>>
>> Signed-off-by: Gowtham Kudupudi <gowtham@ferryfair.com>
>> ---
>>   drivers/pci/controller/dwc/pci-meson.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
>> index 5f8e2f4b3c12..3a7e9f1d5b8c 100644
>> --- a/drivers/pci/controller/dwc/pci-meson.c
>> +++ b/drivers/pci/controller/dwc/pci-meson.c
>> @@ -310,8 +310,8 @@ static int meson_pcie_start_link(struct dw_pcie *pci)
>>   {
>>   	struct meson_pcie *mp = to_meson_pcie(pci);
>>   
>> +	meson_pcie_assert_reset(mp);
>>   	meson_pcie_ltssm_enable(mp);
>> -	meson_pcie_assert_reset(mp);

I think this change is valid, other controllers resets PERST
in the host init callback, so either this or move to the
init callback.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>>   
>>   	return 0;
>>   }
> 
> Hi Gowtham,
> 
> I have a patch [1] that I haven't submitted yet.
> This might be related to your issue, what do you think ?

Ronald, This fix is valid, it's definitely better to probe the
driver with PERST asserted, please send it.

Neil

> 
> [1] https://github.com/rclaveau-tech/linux-khadas/commit/bee0a02d9756
> 


