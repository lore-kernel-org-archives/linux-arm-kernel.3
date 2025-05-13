Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42960C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xOAW4/y1I7dlyrGJJ9emafCDdB62k/71A+ZzQQXgDR8=; b=qE1kpJwC6w4ijO
	Dd6NVxTwq+TGXHuy9Do4Ez6Bu8IwtllK4tXi1ukGlJ7y8EBcB/PpbTfmXDHk1N262p/LcheYzAOd3
	LPuzcLM+woSYzXb12G8sgfe7i+qUhJx5s2vgy573mwd6Sx5SDnXzdzTHrk9SfJNYUC1Zze2msjSbv
	Em9TaKpy5RIkhERpOd1M3bQzvQ2u7mEJXWA0iT2FaJpKnR/0JDguNw83175SfBjgbf6rg1r5bRLNd
	Y6jvi/FZnXH9Li8r8ovimAInqwbC8ib78Dg2mGZoCGckxghU9YYcFdeEALlECd/QCxYLMEQm6CqPF
	m57EjtxvDERfKLRkjsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmzx-0000000C8d2-2khL;
	Tue, 13 May 2025 10:36:33 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmpa-0000000C6CE-2gui
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:25:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso58040595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131949; x=1747736749; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xOAW4/y1I7dlyrGJJ9emafCDdB62k/71A+ZzQQXgDR8=;
        b=yfURcsuosGWkhgBek88/iXxQwk3Ws2Xc56z4mhrMSazxcye1SDdP8CnKDMQVruEx1U
         yJHiiuZ4mk7FS+oCyymU58LbSLBb6+bKL8CTiRmWha0KOLvto0v6JnkOHcX4L2FNU6MN
         SDf1ueVZmLvdfSObvdrd5ycPvg1tx7LgUbPln6PSoXRb+Nlne2RCBj9q/WyDqI/BzYdq
         rZOPyApSg7VxTYLRbn2TC6IQpNxQCQxGmF5Qhi/CpfkDgWVisthBh1aZEtIQ9FNLdlhi
         M9E9G0FoHBUrRJK/M/fYiIEd//pZ2rRi94yrXUxO7tFSHnXa+S0qfjRKdxLdeivGqBq5
         W+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131949; x=1747736749;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xOAW4/y1I7dlyrGJJ9emafCDdB62k/71A+ZzQQXgDR8=;
        b=EQ/EA6NswTdFIYKbrt+7AL+Vwzi6Y73BOepHr0YDSDL7SYhPaoxPOFfbHMTYky18/e
         VJF9JuWkVX9IEjHxjXrw+G2dOQKGzrOeZPkLT9DPRFNko8CkyCFeyRbLzvNHlrsWtj/R
         qI4TH22g+K5gu7TkJO4ybHgtWv8wgv5QpPVbPx9us8JkbO6zIATfqRuEhSSW5aIZfZX/
         xfIGVz8gG4l1IVXPJFxdoKNy0KENwRA42oa9xYbV0QsucwaZayxXVB9hzZSmpK+RBW9l
         mP04KR4WSYH5xAsV/2RoLnPBehvXBpCVJyiLZMG5mAb8tB0bqsfLxyWFq3X6z/MZVs7X
         wr9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiT25Q+JPnsriUN4SVIDvkEMoQpSsJ02/5qiJ20oRcpk0nckDi/IfxMj7Fyva5bEieEXBVwwRzl8oc8PVZz5Oo@lists.infradead.org
X-Gm-Message-State: AOJu0YxRR+XCvNlY33LKMu/WrRmPc8sOMNlfQr+ax9v6wvujFwCEd6ep
	+Vv8jOPD1noCQfMZqpsfsb3wA+yOfIxznzc6eeq6AEeS7wcvqjPnwtJ3+rERs55JyU//l7r7h8l
	okrc=
X-Gm-Gg: ASbGnctfWYUChM0QEf17ZicaUtzZU+9Id0tsxC3ID+Whc4xVud5uioo7fK5ZQ2L6+3w
	TQUA2dWxG4IRVeQuNOCBKirFLuD3c8ugsRqR5wncUx9EUIBHh+V7mseATo94W1wSCFSt41Cc7VO
	TZK2TCFq8lAbpl0lvEViHsA5W4nkhzDdVRHBNRdWwniIo2HoUJM/wXYr0TKa3YIkx4W1Ip3s59j
	OQfy2O6jPjTYeiVs78naZa5txddiNKhgsQS4PzEYSeydIxGWivWTw1FjIio0JGYgDP6my4xuY+9
	lSRD7aJWkkyW097pPk1acs6h7nPjavJIXsS49eJ4eT99tF+hYvZ4VuaHFfi1z74tdHOXUOGwbVF
	B6BgvEG+YsWoU2UnBAzOUhrw=
X-Google-Smtp-Source: AGHT+IER23BQik5Lx2zoekeA+pdHljoqfbrl4jmtmT7/sMAlqJykMtKsTIOYUE8EH690KnhP8BAxRw==
X-Received: by 2002:a05:600c:3ba8:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-442eaa9ba15mr37237455e9.31.1747131948908;
        Tue, 13 May 2025 03:25:48 -0700 (PDT)
Received: from [10.61.1.139] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm198972445e9.33.2025.05.13.03.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 03:25:48 -0700 (PDT)
Message-ID: <04908842-4c55-44a0-b74c-3aca82a1f204@linaro.org>
Date: Tue, 13 May 2025 12:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.16
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_032550_676855_0493A6CD 
X-CRM114-Status: UNSURE (   8.08  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

Here's drivers updates for Amlogic SoCs, refactoring the clk-measure driver to
move more structures to const and support C3 & S4 SoCs.
With Philips' ack, I also picked the A4/A5 reset controller bindings.

Thanks,
Neil

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-driver-for-v6.16

for you to fetch changes up to 87b480e04af45833deb5af1584694b0077805ea6:

   dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller (2025-05-09 17:34:10 +0200)

----------------------------------------------------------------
Amlogic Driver for v6.16:
- Amlogic clk measure memory usage optimization
- Amlogic clk measure support for S4 & C3 Socs
- Amlogic A4/A5 reset controller bindings

----------------------------------------------------------------
Chuan Liu (6):
       soc: amlogic: clk-measure: Optimize the memory size of clk-measure
       soc: amlogic: clk-measure: Define MSR_CLK's register offset separately
       dt-bindings: soc: amlogic: C3 supports clk-measure
       dt-bindings: soc: amlogic: S4 supports clk-measure
       soc: amlogic: clk-measure: Add support for C3
       soc: amlogic: clk-measure: Add support for S4

Zelong Dong (1):
       dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller

  .../bindings/reset/amlogic,meson-reset.yaml        |  22 +-
  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
  drivers/soc/amlogic/meson-clk-measure.c            | 461 +++++++++++++++++++--
  3 files changed, 438 insertions(+), 47 deletions(-)

