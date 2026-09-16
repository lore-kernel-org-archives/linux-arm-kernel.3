Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6F3C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nD+B6Ap2Znzafi5abLa/1qGSU6lf02Nk2PfhG8i1pKQ=; b=D1jZviWS8yC0It
	+kfUgHee6pvwquYu5IYlq+tIj/YE7PPFOXjzxbuYAznKKqY1XTTFcBA8gA41EW7arGu3lxsvCa3xW
	2zJUHseJAf1lLg/4JZMMKB6R1HMteZelHZQAoYkxnYcsbn9/eL5+8wlUR4KNACNI8n/51ltXpLQvw
	N26wltMq54avcgxjB145iLzfuurWvmpfCFgh8DFNVnopcIFwzmTJPE8FosDQh5WiE70XOdrKiKhUy
	JfE+S+e9us2oScHxTQAOIv2DJi2xmU+AuIZ+dnbvQVLHaNYts21W34Vbp6qKzKkPc/2DfNpJypcyY
	bOy3txDh7N5J7GK4lVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ma0-00000008wFZ-0SZO;
	Wed, 16 Sep 2026 10:09:28 +0000
Received: from mail-wr2-x14.google.com ([2a00:1450:4864:30::14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mZw-00000008wEK-3wAz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:09:26 +0000
Received: by mail-wr2-x14.google.com with SMTP id ffacd0b85a97d-482f633ece3so429336f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 03:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789553363; x=1790158163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nD+B6Ap2Znzafi5abLa/1qGSU6lf02Nk2PfhG8i1pKQ=;
        b=NqWAuwHS0C5n20f/BUK2hSHCLYloU+wLGx0r9KUutdmCd/D84iNXODbB7rxtuty8CY
         Xv0yqSg2OK9hCbuP9/gWif5ZZP2RKPbpMY2n4tnNuTqpYxABjwL7aS1kn2GvevEECiub
         QoAwQ/gsvf6Qm6pqAEtdz/D7Uboyw0SgABmMrLEuHNlvjVjyl4TwOnTwCghHjKg3Llwm
         HLPOXFxa3w/ziCIuft1kGBt6SzQVx3WeqrmMokLTIgXvopOIVcJ8OLuJHrWZ0nMvf6BM
         YnUETXcmtzAKp7HnRhSi5UT/zze+rIpZkOkxKoVqVFR8g/Zk/XuhMi6aN9s8C+ZkyzUJ
         DrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553363; x=1790158163;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nD+B6Ap2Znzafi5abLa/1qGSU6lf02Nk2PfhG8i1pKQ=;
        b=fTIrnb5Fvjr44SP24LcunP55LxPQwkQZE0rzuqy0+rDlkG/kaDiFJMb64ZDcNMkQF3
         hyxheMoEZxvrwgT23dPTDvDnntY2XynAETDt9eDpwHPZsC2UdcumshceVXekGFDiPXig
         qugjhHxGHIjI1eSj4itnFQD9FZtcQ9gP9glm5FWo8LXdlpqGkN7owmaJx6C0a2I8gm5r
         KfLOeZ4BmTzc54rs0W4FQp9vL+rYqBpae9eHMvzxqSzv+TtWGnYjSteyS1l0iOCkGFgi
         M6Mr3ileEk6eZnLSC0IFelgIeMze/Cgp0ONeLJuW/yw3zryHd07r0RpJ6wCkP/VRgkjC
         mmLw==
X-Forwarded-Encrypted: i=1; AKwUvBzze2Pyi0ISWCOz9fhFTLX2ocNSQBv4LFCnUNVsIljb33BsVy2EfccVAFv2WLKDoLM6W5nI0tFyEeMQRibHNgPJ@lists.infradead.org
X-Gm-Message-State: AFuF++ma67Z9ErDPOPsehrNPien/ejvgXE2LBiMdJTU09iDazUZp9Hw8
	lYtxl2+kXu55E2jiGr90PynPXP83YwG442uVPS6F0JLTx/VuwDqjpRnE9CAybn454uSa3qbLYwg
	Pe6um
X-Gm-Gg: AYBFou3lZU8yGP1jp7LgUX1smhhaFodC6hmWkon8kwbbXBxdmF8hc4WlTYcf3emhUo8
	MfhiFOccP3tqmWbTCAzIVeGri1+JGM2uHzudBaul4HF4VzcI99zSWbuvM6pt4y5XGNGvluAr5gW
	sGJ1NUxW23cP095YjGZZLBV83toCyAwzQIjoQNmtEgDIk6UqalDmYPhRavyjxzN80mX/pMg916l
	Fq+qDGHDzg6J61+s8+Wc68KvLsy6oop3N692ZtlyMah7ZbihKDKIu5feOoPA+0h1s/JWcuwmCGY
	XaBNVuEqbEl3n2DpX13KjfXDDLtr4Htk6HNo8KgqUlCAkqXAtai0OI4yUc+uwO9t1/5t62VAaNm
	8xJwwwtkj8m4pjhYYohMRI1UZetUdkUka7JZlvxEDy5p9ZGchWzg92DAOtqOSpNZgqkFY9Lophp
	iX2dHopgc+zzi9XXLfx4I7iMXUwH4+Jf3CU0z/FhNmg2gkaXax4AF6VMCg5+QAW6jXE9ye2ivE0
	XxxJ45VtVlfcO0NSsGEe7iZGtBH6sMTQb9zDvQ27NShNwtOcywO8yvWvYi3VrJBdQ==
X-Received: by 2002:a05:6000:2304:b0:487:b32:9d6f with SMTP id ffacd0b85a97d-4870cf25729mr2502387f8f.22.1789553362827;
        Wed, 16 Sep 2026 03:09:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e? ([2a01:e0a:106d:1080:449b:f2fb:7cc4:bd4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf414c3sm4832517f8f.30.2026.09.16.03.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 03:09:22 -0700 (PDT)
Message-ID: <71b955e9-dd75-44ca-8eb8-90267dc70eee@linaro.org>
Date: Wed, 16 Sep 2026 12:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT fixes for v7.3-rc
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_030925_012514_E3E6802A 
X-CRM114-Status: UNSURE (   9.43  )
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

Here's the Amlogic ARM64 DT fixes for v7.3-rc, including a bunch of fixes
for the Amlogic T7/Khadas VIM4.

Thanks,
Neil

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v7.3-rc

for you to fetch changes up to 406292fd75f95aa3010fec95b5beb5a8b7e3ba3a:

   arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM (2026-08-31 14:42:59 +0200)

----------------------------------------------------------------
Amlogic DT Fixes for v7.3:
- Set of fixes for Amlogic T7:
  - use the real UART pclk
  - allow the SD card to be power cycled by dropping regulator-always-on
  - fix the pin groups of two PWM outputs
  - add the CPU cores PWM-driven supplies to fix runtime crashes
  - fix the pin groups of the vsync PWM using non-existing pin group

----------------------------------------------------------------
Lucas Tanure (5):
       arm64: dts: amlogic: t7: use the real UART pclk
       arm64: dts: amlogic: t7: khadas-vim4: allow the SD card to be power cycled
       arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
       arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
       arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM

  .../boot/dts/amlogic/amlogic-t7-a311d2-an400.dts   |   2 +-
  .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 113 ++++++++++++++++++++-
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |  44 ++++++--
  3 files changed, 149 insertions(+), 10 deletions(-)

