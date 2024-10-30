Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CE7D6B6B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 18:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LF9noeTji2b7N8JqoErVzO0xyU0Yhb3GiDpnpvg1GoY=; b=eAaQh0UGElbmz6HKOCvEQFLH5W
	+C9u7kK9gKQnsdvl/yUe4AuUYBCOi4nmx8wmNXi/dU0fHm9n9uKRVRZWmgxGW+6SIFXfQO94FuPH+
	VOBmRhmgFubkjZ0y6vE4iEhwWF4jf9GnZ1qnIKR6fiEEMGH+Ut4tv6tQ93V1gbrkAWBazyyNJ8vmo
	V+l2gEGHe1fQ6mxz9YGI0ePopvOoleKbN/BEKTSoJAaOgpdy/3Ay+k59j9b/RLi0Zs8HWsyRHFw1a
	uAS7n7Li7Lhwx6zk3zXvmBOvGBpqZkGayHRo01EBlKPQZpb0qNLfLgoOSW/iYTba57R4yjHkZGPmx
	dYkRXXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6DAZ-00000001O6q-3tKK;
	Wed, 30 Oct 2024 18:11:48 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6D5D-00000001Mvm-0wmz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 18:06:16 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so496641fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 11:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730311572; x=1730916372; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LF9noeTji2b7N8JqoErVzO0xyU0Yhb3GiDpnpvg1GoY=;
        b=Max8l+QtQQ2r9IVOuPyYNEy7czGAPfNDNm7/AYDEIpVpXPw73kWlsKpwyt1loVMerG
         ZOcsIFtDdqPuyPn3TtPGibeOendsnTj6HVXmIiFTcle7TT2xgNEMtLPhf4z1oASztY+a
         KnZAJAKOm/feEgpOja00DvRMvk0obbuATTeoOwr9qldUMxw/vTn/xBRdsHOnoQdyXr9O
         HaKw8T/0QHaTqE5NRNPG+hF9dy2nhn6gtWAkvvGmRTRBj3DMn7Fhec8RDppb6e6DU0gE
         FpB58FdQL6rCcF9Gsh/UZoRLExN0bbQedwhU3JSPjAPkOHI+spzwH/57avda1O7GdZjl
         OCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730311572; x=1730916372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LF9noeTji2b7N8JqoErVzO0xyU0Yhb3GiDpnpvg1GoY=;
        b=gd2sXWoxTtrIFpK1aiLQ8bWCn02bfiXAzYb/nYpTxRuTnaDX9VhT3EQTVj+QnEzX0A
         kVs0Oyy9GE8nX4G7eXg9+Zk+hAw0cGVBLf+BE8BbHXJgod79dBIz8ZuSa5kr7/joinFF
         9fPwtVtIPu09sP65daXzbCoHwcCe2EP7I5bg6BcOA1/IXSJQ6/CqTRS9dYGEGs8nsTio
         5r+3igoKgDNHoNWO9j1KprcenYI3PErf7YqDTgUQBviiNoCw9HxjHwNtNsZVsP+Zxuxg
         paxk7piGsvSW8Qj/ih/5WMyocygHGiT5c/PjsRSWyJAlBV/hnt8dVVI2h6i16Th2niyy
         38aA==
X-Forwarded-Encrypted: i=1; AJvYcCXA9qJnuchl4t5BVxloPaBrBsjLBttdXN6id3v2LvIJEQc2Cd6W6pAN5KCM5zsEM+leVI8QDLBDkx+0j8nokcYx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjx7gROc05ZiRSEQUkhxZEaqBKNi4Ft/U3rfTkQbHx01DRbaZz
	fpSOa034my6Q2OwSchE6LeuL8RLn+tIlfUoS0YUlj6YAETwlg1I7
X-Google-Smtp-Source: AGHT+IHayk77MRC4z7nR2NME3N5ImHKRJYje2Pp2ODSwtTF/mqu+oMiZahVSN8lWYtzUTFV/l8joWQ==
X-Received: by 2002:a2e:743:0:b0:2fb:587d:310 with SMTP id 38308e7fff4ca-2fdecbf82eemr2635661fa.30.1730311572328;
        Wed, 30 Oct 2024 11:06:12 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb629d8c2sm4901115a12.29.2024.10.30.11.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 11:06:11 -0700 (PDT)
Date: Wed, 30 Oct 2024 19:06:09 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Cleanup Spreadtrum/Unisoc ARM64 DT (part 2)
Message-ID: <ZyJ1keHD-neTNZ2J@standask-GA-A55M-S2HP>
References: <cover.1723716331.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1723716331.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_110615_282342_7B27C3B7 
X-CRM114-Status: UNSURE (   8.16  )
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

Hi all,

not sure which tree this should go through, but could someone pick this up?
It's been sitting for ~2.5 months.

Thanks,
Stanislav

