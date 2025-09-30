Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9226DCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffgRfYtnm1HKc4tZUZavEotYf7CHOSNEIdJwn2PiGvQ=; b=mfc3Kk1AdKZHjpim1Mnd8lqOVz
	b2A0A6J26lYfq9nZvsVRJ08MOaZHukq6C4zkHBFLOkgPhrrWc+Xb7ghq0LAcnSFOna5x4xW1K5EVT
	eRRhYFps1LkFm+NzixYgHtvtzzAf0OfiHJEjfUdaLMcnDzlxkVjjEMwZVLUTwDBIQeyf9Sv1oxdxP
	gU4g0WL0wJr+PlRsWum6ZgeFaVSMD95/fJvjf4ENnviVQ4WS/WsEac1Dx9Qr2miq5tR5FXMsT2nti
	1KkGEKlGCnA+2XqyKDk4CfD3Glh5M/ol65VTh3BzRctSQGvCvj9/8ICCt2we8CFVUd3keiR1U17cn
	0cGCh/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fOf-000000060Eb-0eQj;
	Tue, 30 Sep 2025 18:48:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fOc-000000060Dd-0MH1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 18:48:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-46e52279279so20247605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 11:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759258096; x=1759862896; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffgRfYtnm1HKc4tZUZavEotYf7CHOSNEIdJwn2PiGvQ=;
        b=LPZfPXd74ED+Pfwlh9uuknk5CV1LzHEduuWAEvaG9cBjoCpidlhwq7W10gCrBA/wcD
         +gwW0vABaXScO/p48nYxQ2lj27PKwAupaO4BbUi2XxCR5SZfjsM3MjzuK9J0cuTwNYUZ
         uw+pcIW0PnaYba9dgwojzndKeatfrn31zlAC3/ynd7OEatHtPaVT2sBXMz702zbBAgYK
         d/p6ZEDtHQL+pchBklZDq7DwhlQtr0xb5YMsIF5XNYizKOIfVWO3XX/yRg8Cifvx/mRe
         ZkWGj/jL4kFbTA9XrIsVVjdyaEp8stCUHoGxHaOExWiYHP7hvVTr1ZNgjYixadg09SB1
         O1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759258096; x=1759862896;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ffgRfYtnm1HKc4tZUZavEotYf7CHOSNEIdJwn2PiGvQ=;
        b=IfWoflJhDw8MqnB+1tXXfucMujTxkNVA3IsVuSRhMsJZ/JbmqVEStw6FuCJk689w9Z
         ZN5U2LmQI1jn3Eld1IY+Eqc7Z9T3oszqRKwCyRC3UZ3sXhSzyflLFmwLJXOL9DzZe88d
         Q/6ojm3IOMkEd2Fex/iCOA1E+x/ny1ro2f/z/LGelsBNJJ1lusxJewdjNwow9QxyRohg
         NStstXdARUa7WrvKLVaA12Hi0TbC8sCqZ19AcIQPn6Y2lEyqbz1+xhR+7ifqc2sHEWT4
         dgRvjAmLqbcpVVoH0WpuylA+NrCAl8cH5i+cjN8hFH+/VLiOl67uo4G2+LIRZy5zvdJN
         lRUg==
X-Forwarded-Encrypted: i=1; AJvYcCVryyrGJBP2XKHfnZ/4D3Dtiz7nXlntmJZJ+IGWrh5WtMthxY1KGn1ummtTdGg6zelPvLGNMopi4dncVvgFvCkE@lists.infradead.org
X-Gm-Message-State: AOJu0YwhZk6uIgsbSWGJ4K++18g8orIFCMwtM08t+V6opXJ0HOzIk2dJ
	Kvar39O7pO7RONx26s8TkJT5e/hUtbYCvCqPZHi20TnjRHPGWr6bwrAKwc8VARTfD+o=
X-Gm-Gg: ASbGncvy3mU7OIhCzEt/ygTn1t/ot7pWy4O4VKR5pcBi0Vy74N7G2l6af2iS9Q98Dd/
	wecK9xR3dWkdouswP9ddXE2tIbnCsueVb8DnqD+FA7ZPb13UaNkfNBc3Jp9ZN0qrveyrAxsM8yO
	4o0s2i/RU1in/XMBLoKKkIRVd0LgxqBspWK/5AEHxXqU5sazgstvkZAnYOS9I7YgFXzxzrfyE8X
	nQooLqtdJwbCZxt1hY7P8DtCbowXjq73c0FAxd6wS8pEO0UtfXKkMY8lu7Ge0iNRl7TCddxNsyi
	nSBflYfz231CYnSWnzzks68tqEFp9gBhd7z7s16QhheMh84S0dMv+v+owoMXJR75yPr8Q9zTwPB
	CejUDkOBR4alXzDg92NLsCsq9y+SOMASVGTm6S9o7ni4l+mDO8yPiyVvp5oqN2dwxYEj8Tqow1e
	M25EypSN7I3sl7EqjCzCDrIfI=
X-Google-Smtp-Source: AGHT+IEYI3huopKWdfDQEJir5e/rv3rOBRHS1Emu0fC6ieyMwwYyTSg13GLpRz3qoAuTqhlVIXzV/Q==
X-Received: by 2002:a05:600c:5303:b0:46e:4287:a85e with SMTP id 5b1f17b1804b1-46e612192ecmr7706325e9.13.1759258095988;
        Tue, 30 Sep 2025 11:48:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9459:14e0:525e:d859? ([2a01:e0a:3d9:2080:9459:14e0:525e:d859])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6199fb54sm5013245e9.9.2025.09.30.11.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 11:48:15 -0700 (PDT)
Message-ID: <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
Date: Tue, 30 Sep 2025 20:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss
 <luca.weiss@fairphone.com>, Abel Vesa <abel.vesa@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
 <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
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
In-Reply-To: <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_114818_157411_3C19AC44 
X-CRM114-Status: GOOD (  15.33  )
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

On 9/30/25 20:43, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
>> The ports definition currently defined in the usb-switch.yaml
>> fits standards devices which are either recipient of altmode
>> muxing and orientation switching events or an element of the
>> USB Super Speed data lanes.
>>
>> This doesn't necessarely fit combo PHYs like the Qualcomm
>> USB3/DP Combo which has a different ports representation.
>>
>> Move the ports definition to a separate usb-switch-ports.yaml
>> and reference it next to the usb-switch.yaml, except for
>> the Qualcomm USB3/DP Combo PHY bindings.
> 
> Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
> and keep ports definitions inside the usb-switch schema?

Rob asked to not do that... see https://lore.kernel.org/all/20250905175533.GA1000951-robh@kernel.org/

Neil

> 
>>
>> Reported-by: Rob Herring <robh@kernel.org>
>> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
>> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |  4 +-
>>   .../bindings/phy/samsung,usb3-drd-phy.yaml         |  4 +-
>>   .../devicetree/bindings/usb/fcs,fsa4480.yaml       |  1 +
>>   .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |  1 +
>>   .../devicetree/bindings/usb/nxp,ptn36502.yaml      |  1 +
>>   .../devicetree/bindings/usb/onnn,nb7vpq904m.yaml   |  1 +
>>   .../devicetree/bindings/usb/parade,ps8830.yaml     |  1 +
>>   .../bindings/usb/qcom,wcd939x-usbss.yaml           |  1 +
>>   .../devicetree/bindings/usb/ti,tusb1046.yaml       |  1 +
>>   .../devicetree/bindings/usb/usb-switch-ports.yaml  | 68 ++++++++++++++++++++++
>>   .../devicetree/bindings/usb/usb-switch.yaml        | 52 -----------------
>>   11 files changed, 81 insertions(+), 54 deletions(-)
>>
> 


