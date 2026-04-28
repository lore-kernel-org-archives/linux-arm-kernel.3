Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5CAFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 06:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxnJDsiLoEpa/m7NLqqTA9NgaVmiWqcUp6yYED16WIA=; b=JcW5d0SLf8b6rB/BVM6u8UBXOs
	lzRN8edhas4Pm0fy66TQ6ODod5yUYH1PzCTTVW/s/LwlolGy2xbZceJyQ5CxQPMcOhrge+EdNuED1
	QUZ5bnqE7Atpyj3AY8fgrx89soOr3eQIKaDeCbEoJD1veWMJCaJp9Knz4bOqxiDR63yor5CdAgWWq
	FiOM9z/jLY3St/fHSiGGNClZvJ7lZpGQtYrLCkRvPBjs5DHIN8xqFLgttu8M8UzxCoTcZHjeDpLcl
	J3KaB4fp2/JrBfBj2bQl2QZE3w1Y3KnB17/z8iRjGiCLvJIAyGOAh3mihmq/JkUocwPO05C7LWvf8
	1soqtbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHc17-00000000ddn-35me;
	Tue, 28 Apr 2026 06:33:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHc14-00000000ddB-31Gf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 06:33:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE0B11684;
	Mon, 27 Apr 2026 23:33:46 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA0303F763;
	Mon, 27 Apr 2026 23:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777358032; bh=YWZkQJ9h/l4InQ9uofXyJ+ye5Z9Xuqt0qS0AfrrKrA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2Xn++cFmmQu5248cOji44fY/eMi8BJevcEh3M2220AM7CaQvnqARY5FplvC+PS10
	 4iz+okyCYpf0DlRtOwQYdzny5aSVGEYjdCRYKEDiF5c70/sYXZmuYUcqlHelxcYqf1
	 KRe3lPH1nJVHXIoAJjsZr9rXaNM3RhkobsAhrKeY=
Date: Tue, 28 Apr 2026 07:33:49 +0100
From: Leo Yan <leo.yan@arm.com>
To: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/4] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
Message-ID: <20260428063349.GD16537@e132581.arm.com>
References: <20260426-extended-cti-v8-0-23b900a4902f@oss.qualcomm.com>
 <20260426-extended-cti-v8-1-23b900a4902f@oss.qualcomm.com>
 <20260427165913.GA16537@e132581.arm.com>
 <b20a2f7c-4838-408f-94ed-ee9656d451c4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b20a2f7c-4838-408f-94ed-ee9656d451c4@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_233354_890737_C8CF86FA 
X-CRM114-Status: UNSURE (   7.68  )
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

On Tue, Apr 28, 2026 at 10:25:11AM +0800, Yingchao Deng (Consultant) wrote:

[...]

> >    tg->used_mask = bitmap_zalloc(nr_filter_sigs, GFP_KERNEL);

> "nr_filter_sigs" is the count of entries in the DT property array, if the DT
> property is:
>     arm,trig-filters = <22 23>;
> Here nr_filter_sigs=2, so bitmap_zalloc(2) allocates only 1 unsigned long
> (64 bits). set_bit(22/23, used_mask) still fits, but it's logically an OOB,
> and any index >=64 would
> write past the end.

Thanks for explanation. It is correct for me.

