Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F826CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yqstp8v0w5ZqvhHqs9nCFyjLloZ4iTt0o1sbH2L91Q0=; b=VtdnykUrdg8zzw893fmT8Dhwgw
	KhKcSmPW2SGuCbwweC8oqFycvMwddWCsqihOXtA/lzvYBWVtZgIF2Lvl6wUZvYODQ+seGFkkH/8Uf
	a1OZ/td8sXbnndefy0QY18goTsyTuuON6m2tlnPtDAIz+97sRw0NptJRa2CHAsCm/zUreV2rztOCe
	nFty7/X9ndPuG8TBGaduvdZGdxAJufuJZ4ZeAj4UdGSVa4LgvUe2b8paG7+CIC7Aa/6KoiOjxObz8
	aqDIWyxnOPtATBZImMo+m9SXh3WjvHWDiji4hRpQSrRx9+1/6cXBCJEaOyr4/gFYthRU+az6/Oz3a
	bLdVX/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hrE-00000007Nhe-0ajd;
	Thu, 25 Sep 2025 09:01:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hrB-00000007NfC-3o7E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:01:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so1923535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758790900; x=1759395700; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqstp8v0w5ZqvhHqs9nCFyjLloZ4iTt0o1sbH2L91Q0=;
        b=MnXj1slRok0I7IdIoOBwMucD7e+EFpCJHSaDdo6/Cb6oNFoG2tb2EKvmGJU+bJejG8
         jbseDJsoRmp3fElPuNU4z/DNAaTt4q2+lX2GkSPg1OGKyacjcSflEPTP3fOAD1tQzLu1
         4aBF95ogpdbZncwMwYEaOHYJH2RinSSCaxKqIGa28Sh+lERHDlmIY+TdPXhTsZLDuYz+
         nPLe+6P4ykQGr4QJlTDL3nMVE5ZbdyisHPaVduD8egXqqno+zUoAnmdYQnwRLovvprjp
         H1stE2VJkDnbkxxEwkpd5C757AKLUZSab2mE+U7xJwmpgXW7p1Hke0oGMRPpI8heDEDg
         /CjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790900; x=1759395700;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yqstp8v0w5ZqvhHqs9nCFyjLloZ4iTt0o1sbH2L91Q0=;
        b=wPhGs1rsi3S7bC7ngVBw3cmFkrSSW/E08mZFTKQ/vBa27Z6+M6zKi7dt9Z3joO3Q0b
         WOd72YgsawbJdqYXqCinabVojOFGQgM9qcEz/xp/MDFKI/8UhgP+PxyvYPD+hTZYi0TM
         vsbuTMgXsd3TWqumBKIFFT0JQBW2/2m6sEGp6WAXhTYOGWnxTbYUW7u9aMiXNV8SRz3Y
         6FTVAItSnlYvP2TyZzK2XNosTY4Hqe8A+VFW7KDtuidIr4CPnIUVVz/XlU3jXboX7EBD
         D0KEezNAK9HFA8pruWHKwMJjLJPKDj04SpXx21/Yyf0PB6fG3V+HLkWf7zQm1XYi/aZm
         6eXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyx+qDLW7j0Kh1UDKgdHN8lx2nz86R60b1ZIl6bvJCGbMDWTS20SvgDqDXmVpeYVx4qWLJsu8cS8E6xS6i3xaG@lists.infradead.org
X-Gm-Message-State: AOJu0YwkapzcxwRr2v1z+hH5ANeYFbkduil4D4EWyWY2TMqwCU3Tz+yI
	YW61quGZxEZA/1gBvR9aLSFY6zs3hK48t6Eu9NjEPr9PlhnWM3QBcfBcIWwZSauVAns=
X-Gm-Gg: ASbGncsBgKKQUHTgakIqzYu7AAWxOJYdO3dStSaghCZYphZwI/0dWrR5I8/t5Ys4ayE
	OR3EAT0tc2RWvNd5A1d2R0oLzf8Xo/yA0SDNyTxG0DaCsO/u3ZCVqBqD8xQcVU3EN61ENZWqXnj
	2LV5j5XDUfqjq9tX6kNvJQJrzkVBJ80CSKzdkkm3qOu+XWSQvX77uMp/4EtNuIp7RTVdGk8SeX2
	o1gbYxl/gifYX54D1Ev0Fgnh774wCpJvBRV6/mvwlFIxBjzvO7NsTvZTS8dNA5k/D4XsGJlaT3V
	9lgZetOcWNNHDqIgnktfiRmCng/mgzS1ZuutKdHDsZluXLBYBGVGAlv8KQYSmSEZZzyUQM3VAMi
	IPohQycxuaJSfrpSfaTf/X2y/kQF/8rmcoEfqn/A2NEi7NJqFj4/i4jLdVYTgXfV9M6IxP5MVoA
	PDO928C7ND+n72JLxC44/kMr2vtZn+57w=
X-Google-Smtp-Source: AGHT+IFPH5bNTpMjVvNRN26DifPNLAFoSeAoicHRC1HEEH9oRvExzs+S4YeuHSGoOiaUNTFghFYSSQ==
X-Received: by 2002:a05:600c:358e:b0:468:9798:1b4d with SMTP id 5b1f17b1804b1-46e329d1b47mr30509265e9.7.1758790900027;
        Thu, 25 Sep 2025 02:01:40 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb7203b8asm2128929f8f.9.2025.09.25.02.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 02:01:39 -0700 (PDT)
Message-ID: <14df3870-6cb1-4e5d-9c4d-bb8acef8c594@linaro.org>
Date: Thu, 25 Sep 2025 10:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: clock: qcom: Add support for CAMCC for
 Kaanapali
To: Taniya Das <quic_tdas@quicinc.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-3-d7ea96b4784a@oss.qualcomm.com>
 <4315205b-5320-4a8f-a707-45f5eb35ae51@linaro.org>
 <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <8c558ac3-541b-47c4-be4b-c9101997de7c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_020141_977465_9A61A842 
X-CRM114-Status: UNSURE (   9.37  )
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

On 25/09/2025 09:46, Taniya Das wrote:
>> BIST == Built In Self Test ?
>>
>> Can this not just be put into one camcc header ?
> These are two different clock controllers CAMCC and CAM_BIST_MCLK they
> should not be in the same header.

BIST means Built In Self Test ?

Is this really something to be upstreamed ?

---
bod

