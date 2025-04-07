Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6D0C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzqYqpX1n+9iBoljfssVQ71YHV7yXI4Hc7MudyfJowk=; b=AIe+GCyq2peqvzSzd7sj8ZZLVa
	RqjfPF3E79TEMWvYfCH4uLAg9+vPJ+ry2cHlduvcezxHyqVuferoT9/7XGMzYrpxgp0Dnl2ueU5aI
	YgSE5om2+eyccVxBLMZZXsFnpjM0zwaQsNoUgJiggJBwG9POd33l4aMcbJrzk/z5t5Ob9mVztw381
	4/LWKMykHI5pdJIBEhCiHEiIpSGqCxunrHZuFUGtlPDnzbD0Iye0QkJDdzsKWUNM/hRrjwuy0DX2/
	CLSZzfZMucnxbHik1exLVIj3iVIkG7+rcIfoJYEXX549FReNSQTGexqBm2GiZnEP2FgZADx6rlnv7
	nt/+qlhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hQM-0000000GufG-06pX;
	Mon, 07 Apr 2025 08:01:42 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hG0-0000000GrQk-27yZ;
	Mon, 07 Apr 2025 07:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744012236; x=1744617036; i=markus.elfring@web.de;
	bh=qzqYqpX1n+9iBoljfssVQ71YHV7yXI4Hc7MudyfJowk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sWopx7xvOIqDpk/rw3r8Q95+2HHtLbsF1C7cTccGgg996R71sAiDqnthOsSoJOrA
	 6+A1nDQ07zh03mN0PygsY2P0q4205ukJoh+ludqIVU4cipZJx6wSLMg/x2r1t9M/T
	 39YCcGFSOjEnQBA6UdXKHJxdd1pNSOS63kvgEHub9DQfBcLet2hhtJcvZXbV7Rky9
	 g5xBFRSv5PbapbXNW5NNFoGX+Kquua33hdCODj6BlZ6l6WiBt9SD5y9jWqv9bf/G8
	 w/zqb2T/JuX+Gg3QEmCuOh5IYgOyM58axcrDnKYEicAbR/yoWrsyH9BUF7laZx6p2
	 2UvuugT255GYBM7JAw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.4]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7gXQ-1sx8BC26vS-013ax6; Mon, 07
 Apr 2025 09:50:36 +0200
Message-ID: <b429eb4d-514d-410f-8443-7e3f40709951@web.de>
Date: Mon, 7 Apr 2025 09:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rex Lu <rex.lu@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Shengyu Qu <wiagn233@outlook.com>
References: <20250407032349.83360-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt7996: Fix null-ptr-deref in
 mt7996_mmio_wed_init()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250407032349.83360-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UyaaN9+jk/ECW7DFcQreDAuUpqxrW+hgEQpFAN5vL+Xk7uyrKqV
 +EUNAU6Cv+xDaECNkjN1LIEyvYICi2AFBiQ7r8mrRBmYsSeNd2UwCd9XqUkY2JPnRBVUmN2
 h0gmmb0mHyQ87sV39w4LuwIWX4ajZh5cdb/0APWFFd2VQlMvSFkeIPe7VuOiKjZTg1ArzQv
 Yf6BT3zSFj+s8FojjKDGA==
UI-OutboundReport: notjunk:1;M01:P0:rGWYfE/QzDg=;DQE66In2XWKiA1TpSrWROWLIh1P
 Caplna0f2CPkP/kc2OpqsL1kow6F+YtowFp+R9whgFTLaOpBZpHsCr+0/OeHoAztVkmlNtpNF
 1EodH7GJcu4KJsiEP1VkNQspO9Z5/E7yjy5Xwy0mEtHN4gQ+paobRTm25kHiFirSO0Hes4nQj
 DiGL14Kihm1t7DjPi9smIDkvCn3yICFqnBUP4lZ3fOyVqdWT5o2Z1rBwGzw7IlgKnGWVoIim6
 HxAZSJrOvEapTKXeWrhjKLqXVt0AgmgFVVau56CLh3YtGaw+uw9umRrmgQfcWwpVB8EgVf/Ba
 DPwQI/KsLI6lz2BeVuRS1OAaMUNYZnAsColfR2D1dYA+BRvT9TPLXb7ovFJwe5AY/24Eg+RGv
 x7EE7skkdkz2P4QagnJI5pZhmclxNFYHgN+4henoy2txUgjTpuwJItWky3vJlGU0MvAhBWZ/E
 ddnziPFxXPntKyCRI0NpG1wF1xoo139zfa16c+/fuJuZbM6H074XZ59PF0sYtA+Exqtm4lizM
 nAFZ4eiI/9PcdTDZnpi+uvKcJPBwPbYFOB17L5M1M+zUQ7UFaW7XW0lelP09S4jzZp0OjkZM5
 f6ZjrWPZpH8AdBZ6cZADZouqTTUHVfKdaBISTcmX65FktrGIUMRV7zZzmVRBFC/ZFYn9Vb8RW
 mhS4B4irb/UWYrStuei0fpjSaJbMU0Wb51WbQr5W80yNLTDimff4B6GpQfcTUSWAeX531Wyk7
 Fegu8S+iXB8w/PhW2AvQGH8hBMrCAKeMeRyjELdr6BTSJPy34H4XRanpy7pEi5kj/jvh5iQf7
 6OWTV/6wmgTdyn383O9L5PH/49Bz/kj1YnkywIuuKQhsZUndmjioEh8z8ZEdooAtMFq4+rsuP
 y/Ecf4EFz5LfN4ebl7itTooFQJkQJ3McG3QSXPGpLKD0Ga7HaDdD8DUYgPShgRArEa0t9JIA6
 60oGy/8puUokr/j7kikD+tOC9bK/xl0Vo8RNCE73CCwDlzAX5HMu6czFM7YWJpzusOlnaH+q7
 SPHtYAgZSWFGeiQ7cY3Q6ylbyR8QDl1g+UU7e9T5JLbaoIRvRNg71L2DxqfJWKQY8PSqsBRlS
 sh1QP5I4mKbYp8gVaNh/hZK9iGX8rD8ska95FpWMoPdru5/gmy+Z8Zt5e4GdM+Cpeoxma/2CA
 kyW2fKe+/t45jiyxtjtaVBpP+8y3MYuB1fUjZbT2jntQoEhDhts+GeWJ9JPkTlBQZFqHaVvSs
 RasTOa+y+NB4TI+1v61qnNK770x90O0htoHtBKXswg6mYw6ViBdfZFY1BneciPd7o4ZpMTzol
 Nm5xMh2L4q5ls7RI0ogQm6Dx3J7lXN2mOyBdDvQfRUbIn9TNUEWzvlsYKo8Mnjhb+OC7Xa7Yf
 DPtf6J6PQIhx2WZ84tYq3om6RY8C0PmujbcXElsvs9uILVsNx325SEOpQTj7tvfKnUT5LoM0M
 V0kZs7j8DvoweK+IZfGFW5J1+NgrQ2J+w+4wGREwWK4jkr7Z9nIO9ITblGKXphb5+OXO+Qw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_005100_943338_D972C607 
X-CRM114-Status: UNSURE (   3.88  )
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

=E2=80=A6
> Prevent null pointer dereference in mt7996_mmio_wed_init()

Would you occasionally like to mark the end of sentences with a dot?


Can any other summary phrase variant become more desirable accordingly?

Regards,
Markus

