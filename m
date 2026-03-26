Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D61106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	CC:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZcOs3lK1mwkBYAG3vaFXGT1WiNx/8CwPsN3DC9/Kl8=; b=zdRyyc4rVjpGWve8WUeMMbr7yb
	Z24RmQWdGk0OrTvpPkXb9lEVt7O7FxlVnORClsiHeipTW38bvfkLZzZlB93UUkiNo+ZoKcU7wAh+C
	a0tQP2Z4nM3esZini0FqV1yl3mmmacL0A/qENHQ0O135LxwGLhiLuk04CIAH0kCfc1IPED31GJG2t
	WQg2Cin9ZDdeNMNEojXJbY3MqV8tUCzXLYvdgcjsq8WTD5Aq4t3ex8LVkI7rnX1mPDQpmM962Nf3S
	qYlmVxejBsIkEz801UU0N2bZef1vjVW9afnCj8PORUaamqqKjwrbVBDk7/kUAInpv7qkrfeVROz2O
	TLnodmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5h4L-000000059v8-1Knt;
	Thu, 26 Mar 2026 09:32:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5h4G-000000059u4-3mAU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:32:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7cj4N2887384;
	Thu, 26 Mar 2026 09:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7ZcOs3lK1mwkBYAG3vaFXGT1
	WiNx/8CwPsN3DC9/Kl8=; b=VHK+OwBqrb/jIeg7Z6rU47Q7EZPDt+OsSkTFquJK
	pEYguWZlwAUL1qsUFPri9K3/HheI13cgKgMM/qow+jKYb2QiiSt0rhhwsu2YGr0N
	SYBIAJ7BtuUV77g6QBmTZ/sG+u5RcmtrywXRj9XIcl11UudT5Wv+WbNTd9U0x4wj
	PEFCl0MF3v9CUyppdKjFQzQ+mvjbYFK4ZHfRq2I89dOpqZE1XH2TwefdumYDXvSB
	ORcVX0/GX4MRkxUz5Y6huf0E3KJtpl5fkRhDwkfkXNKnYL4dicb/JmiW2ZiB6uXH
	z9te0dMTVVMDym4RSAQZ/Yt30diLTk9cmWK5Q264MuwGaQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d50kg8d1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 09:31:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 62Q9VoUQ028515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 09:31:50 GMT
Received: from [10.204.79.33] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 02:31:47 -0700
Content-Type: multipart/mixed;
	boundary="------------2gI2eoKme0bH8KCK7OmOpyT0"
Message-ID: <746a23cc-5209-42c0-9b7b-c4b31773b376@quicinc.com>
Date: Thu, 26 Mar 2026 15:01:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
 <acHwvzjcvqNxUjm3@baldur>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <acHwvzjcvqNxUjm3@baldur>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=SMZPlevH c=1 sm=1 tr=0 ts=69c4fd08 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=shjDwlezJQZ-e_yClBgA:9 a=QEXdDO2ut3YA:10
 a=UTGa4Y249nOA4cxuRoAA:9 a=PZH07hVFzkJehQwI:21 a=_W_S_7VecoQA:10
 a=L03L2QfmqWoA:10 a=1WNtSb5ECZgA:10 a=82JZpTc5bpwA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfXy8Xre6JJQICl
 jsKLtuXLljwPwI8jhMqo6vk0f8JqRpus0AobgBD6HALKsddzpSYE0KCVMNhCg1HWUo2LrhAkUG5
 67LyLRh7nOWFUPI0hD+zn3h82gIcbxbLp+LRhTGqz4cmBVkz88tCY7xOV43MPVVqk8kOjsAVag8
 teLS3n/wvvxZg/fXLFYGNZ87Mo8r+wFcMZ+D86NqBhWU1/DO2g5XlWoZoiovMC+pAwXa/jl2Qjd
 E5DuFI//CS0I8YTx2D5boQggiLmdlJEOwfCXgd4GH2agyV3YbDEKHg5qMMkCnwATjc5NmAtCdaW
 N7cDAetUi7A1QIYHpGTfpQnJigOix6PQw+9oEsUVR4/g+vFUwCtYZ8a8Wexd31qObvM6le8ekOS
 qfTdH6UnYcZ2ayL4DkEpw5lRKVaoGE0o1UPNDsePkj3GbPzOK7ghNDMU+EPqcD09w/dhbUZIMt/
 Wo1FEMZbC1dWguWwIxg==
X-Proofpoint-GUID: Iu5jy0zvCjJiDv2rPw6PhcS4hJMq5iRV
X-Proofpoint-ORIG-GUID: Iu5jy0zvCjJiDv2rPw6PhcS4hJMq5iRV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_023157_089129_D65BBCD8 
X-CRM114-Status: GOOD (  18.39  )
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

--------------2gI2eoKme0bH8KCK7OmOpyT0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 3/24/2026 7:34 AM, Bjorn Andersson wrote:
> On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
>>
> 
> Please add Fixes: tag.

Hi Bjorn,

Sure, will add in new patchset.

> 
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Please start using your oss.qualcomm.com address.
> 
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> index 3837f6785320..6ba4e69bf377 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>>  
>>  		vreg_l12b_1p8: ldo12 {
>>  			regulator-name = "vreg_l12b_1p8";
>> -			regulator-min-microvolt = <1200000>;
>> +			regulator-min-microvolt = <1650000>;
> 
> Are you sure it's not supposed to be 1.8V, given the name of the rail?
> 
> Regards,
> Bjorn
> 

There was already discussion regarding the minimum voltage for this regulator for sm8550 target
on other upstream patch. Attaching the link of the patch.


This values is according to the NT37801 panel sec
"The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
VDDI=1.65V~1.95V."

Thanks,
Ayushi

>>  			regulator-max-microvolt = <1800000>;
>>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>  			regulator-allow-set-load;
>> -- 
>> 2.34.1
>>

--------------2gI2eoKme0bH8KCK7OmOpyT0
Content-Type: text/html; charset="UTF-8";
	name="https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com/"
Content-Disposition: attachment;
	filename*0="https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qua";
	filename*1="lcomm.com/"
Content-Location: https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com/
Content-Transfer-Encoding: base64

PCFkb2N0eXBlIGh0bWw+PGh0bWwgbGFuZz0iZW4iPjxoZWFkPjx0aXRsZT5NYWtpbmcgc3Vy
ZSB5b3UmIzM5O3JlIG5vdCBhIGJvdCE8L3RpdGxlPjxsaW5rIHJlbD0ic3R5bGVzaGVldCIg
aHJlZj0iLy53aXRoaW4ud2Vic2l0ZS94L3hlc3MveGVzcy5taW4uY3NzP2NhY2hlYnVzdGVy
PTEuMjUuMCI+PG1ldGEgbmFtZT0idmlld3BvcnQiIGNvbnRlbnQ9IndpZHRoPWRldmljZS13
aWR0aCwgaW5pdGlhbC1zY2FsZT0xLjAiPjxtZXRhIG5hbWU9InJvYm90cyIgY29udGVudD0i
bm9pbmRleCxub2ZvbGxvdyI+PHN0eWxlPgogICAgICAgIGJvZHksCiAgICAgICAgaHRtbCB7
CiAgICAgICAgICAgIGhlaWdodDogMTAwJTsKICAgICAgICAgICAgZGlzcGxheTogZmxleDsK
ICAgICAgICAgICAganVzdGlmeS1jb250ZW50OiBjZW50ZXI7CiAgICAgICAgICAgIGFsaWdu
LWl0ZW1zOiBjZW50ZXI7CiAgICAgICAgICAgIG1hcmdpbi1sZWZ0OiBhdXRvOwogICAgICAg
ICAgICBtYXJnaW4tcmlnaHQ6IGF1dG87CiAgICAgICAgfQoKICAgICAgICAuY2VudGVyZWQt
ZGl2IHsKICAgICAgICAgICAgdGV4dC1hbGlnbjogY2VudGVyOwogICAgICAgIH0KCiAgICAg
ICAgI3N0YXR1cyB7CiAgICAgICAgICAgIGZvbnQtdmFyaWFudC1udW1lcmljOiB0YWJ1bGFy
LW51bXM7CiAgICAgICAgfQoKICAgICAgICAjcHJvZ3Jlc3MgewogICAgICAgICAgICBkaXNw
bGF5OiBub25lOwogICAgICAgICAgICB3aWR0aDogOTAlOwogICAgICAgICAgICB3aWR0aDog
bWluKDIwcmVtLCA5MCUpOwogICAgICAgICAgICBoZWlnaHQ6IDJyZW07CiAgICAgICAgICAg
IGJvcmRlci1yYWRpdXM6IDFyZW07CiAgICAgICAgICAgIG92ZXJmbG93OiBoaWRkZW47CiAg
ICAgICAgICAgIG1hcmdpbjogMXJlbSAwIDJyZW07CiAgICAgICAgICAgIG91dGxpbmUtb2Zm
c2V0OiAycHg7CiAgICAgICAgICAgIG91dGxpbmU6ICNiMTYyODYgc29saWQgNHB4OwogICAg
ICAgIH0KCiAgICAgICAgLmJhci1pbm5lciB7CiAgICAgICAgICAgIGJhY2tncm91bmQtY29s
b3I6ICNiMTYyODY7CiAgICAgICAgICAgIGhlaWdodDogMTAwJTsKICAgICAgICAgICAgd2lk
dGg6IDA7CiAgICAgICAgICAgIHRyYW5zaXRpb246IHdpZHRoIDAuMjVzIGVhc2UtaW47CiAg
ICAgICAgfQogICAgCTwvc3R5bGU+PHNjcmlwdCBpZD0iYW51YmlzX3ZlcnNpb24iIHR5cGU9
ImFwcGxpY2F0aW9uL2pzb24iPiIxLjI1LjAiCjwvc2NyaXB0PjxzY3JpcHQgaWQ9ImFudWJp
c19jaGFsbGVuZ2UiIHR5cGU9ImFwcGxpY2F0aW9uL2pzb24iPnsicnVsZXMiOnsiYWxnb3Jp
dGhtIjoiZmFzdCIsImRpZmZpY3VsdHkiOjR9LCJjaGFsbGVuZ2UiOnsiaXNzdWVkQXQiOiIy
MDI2LTAzLTI2VDA5OjMxOjA2LjQzNjY1ODcxNVoiLCJtZXRhZGF0YSI6eyJVc2VyLUFnZW50
IjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NDsgcnY6MTQwLjAp
IEdlY2tvLzIwMTAwMTAxIFRodW5kZXJiaXJkLzE0MC43LjIiLCJYLVJlYWwtSXAiOiIxNjMu
MTE2LjIxOS4zNCJ9LCJpZCI6IjAxOWQyOTdiLWI1NDQtNzlmYy1hOTFkLTkxNGFmMzNjNDg3
MCIsIm1ldGhvZCI6ImZhc3QiLCJyYW5kb21EYXRhIjoiM2IzZjFkZDMyNTJhOWNiOWU2Njg4
YTdjODc3OThlMmE2YjE4NWEwMjRlNGJiZjY4ZTYyZWMyNDQyMzM4MGEzNTA3MTgyMmVhN2Zk
OGM2ZDE1YmY4Zjg4NjU2MDZjOGFiOGEyZjI2MTU4NzI1YzU5NGIwMjM2Mzg1M2U2OThiOWUi
LCJwb2xpY3lSdWxlSGFzaCI6ImRiZjk0MjA4ODc4OGNjOTYiLCJkaWZmaWN1bHR5Ijo0LCJz
cGVudCI6ZmFsc2V9fQo8L3NjcmlwdD48c2NyaXB0IGlkPSJhbnViaXNfYmFzZV9wcmVmaXgi
IHR5cGU9ImFwcGxpY2F0aW9uL2pzb24iPiIiCjwvc2NyaXB0PjxzY3JpcHQgaWQ9ImFudWJp
c19wdWJsaWNfdXJsIiB0eXBlPSJhcHBsaWNhdGlvbi9qc29uIj4iIgo8L3NjcmlwdD48L2hl
YWQ+PGJvZHkgaWQ9InRvcCI+PHNjcmlwdCB0eXBlPSJpZ25vcmUiPjxhIGhyZWY9Ii8ud2l0
aGluLndlYnNpdGUveC9jbWQvYW51YmlzL2FwaS9ob25leXBvdC84ZmE5Y2Y2MC00ZDJiLTRi
MjgtOTM0YS1jZjI0MWNjYWNkOWYvaW5pdCI+RG9uJ3QgY2xpY2sgbWU8L2E+PC9zY3JpcHQ+
PG1haW4+PGgxIGlkPSJ0aXRsZSIgY2xhc3M9ImNlbnRlcmVkLWRpdiI+TWFraW5nIHN1cmUg
eW91JiMzOTtyZSBub3QgYSBib3QhPC9oMT48ZGl2IGNsYXNzPSJjZW50ZXJlZC1kaXYiPjxp
bWcgaWQ9ImltYWdlIiBzdHlsZT0id2lkdGg6MTAwJTttYXgtd2lkdGg6MjU2cHg7IiBzcmM9
Ii8ud2l0aGluLndlYnNpdGUveC9jbWQvYW51YmlzL3N0YXRpYy9pbWcvcGVuc2l2ZS53ZWJw
P2NhY2hlQnVzdGVyPTEuMjUuMCI+IDxpbWcgc3R5bGU9ImRpc3BsYXk6bm9uZTsiIHN0eWxl
PSJ3aWR0aDoxMDAlO21heC13aWR0aDoyNTZweDsiIHNyYz0iLy53aXRoaW4ud2Vic2l0ZS94
L2NtZC9hbnViaXMvc3RhdGljL2ltZy9oYXBweS53ZWJwP2NhY2hlQnVzdGVyPTEuMjUuMCI+
PHAgaWQ9InN0YXR1cyI+TG9hZGluZy4uLjwvcD48c2NyaXB0IGFzeW5jIHR5cGU9Im1vZHVs
ZSIgc3JjPSIvLndpdGhpbi53ZWJzaXRlL3gvY21kL2FudWJpcy9zdGF0aWMvanMvbWFpbi5t
anM/Y2FjaGVCdXN0ZXI9MS4yNS4wIj48L3NjcmlwdD48ZGl2IGlkPSJwcm9ncmVzcyIgcm9s
ZT0icHJvZ3Jlc3NiYXIiIGFyaWEtbGFiZWxsZWRieT0ic3RhdHVzIj48ZGl2IGNsYXNzPSJi
YXItaW5uZXIiPjwvZGl2PjwvZGl2PjxkZXRhaWxzPjxwPllvdSBhcmUgc2VlaW5nIHRoaXMg
YmVjYXVzZSB0aGUgYWRtaW5pc3RyYXRvciBvZiB0aGlzIHdlYnNpdGUgaGFzIHNldCB1cCBB
bnViaXMgdG8gcHJvdGVjdCB0aGUgc2VydmVyIGFnYWluc3QgdGhlIHNjb3VyZ2Ugb2YgQUkg
Y29tcGFuaWVzIGFnZ3Jlc3NpdmVseSBzY3JhcGluZyB3ZWJzaXRlcy4gVGhpcyBjYW4gYW5k
IGRvZXMgY2F1c2UgZG93bnRpbWUgZm9yIHRoZSB3ZWJzaXRlcywgd2hpY2ggbWFrZXMgdGhl
aXIgcmVzb3VyY2VzIGluYWNjZXNzaWJsZSBmb3IgZXZlcnlvbmUuPC9wPjxwPkFudWJpcyBp
cyBhIGNvbXByb21pc2UuIEFudWJpcyB1c2VzIGEgUHJvb2Ytb2YtV29yayBzY2hlbWUgaW4g
dGhlIHZlaW4gb2YgSGFzaGNhc2gsIGEgcHJvcG9zZWQgcHJvb2Ytb2Ytd29yayBzY2hlbWUg
Zm9yIHJlZHVjaW5nIGVtYWlsIHNwYW0uIFRoZSBpZGVhIGlzIHRoYXQgYXQgaW5kaXZpZHVh
bCBzY2FsZXMgdGhlIGFkZGl0aW9uYWwgbG9hZCBpcyBpZ25vcmFibGUsIGJ1dCBhdCBtYXNz
IHNjcmFwZXIgbGV2ZWxzIGl0IGFkZHMgdXAgYW5kIG1ha2VzIHNjcmFwaW5nIG11Y2ggbW9y
ZSBleHBlbnNpdmUuPC9wPjxwPlVsdGltYXRlbHksIHRoaXMgaXMgYSBwbGFjZWhvbGRlciBz
b2x1dGlvbiBzbyB0aGF0IG1vcmUgdGltZSBjYW4gYmUgc3BlbnQgb24gZmluZ2VycHJpbnRp
bmcgYW5kIGlkZW50aWZ5aW5nIGhlYWRsZXNzIGJyb3dzZXJzIChFRzogdmlhIGhvdyB0aGV5
IGRvIGZvbnQgcmVuZGVyaW5nKSBzbyB0aGF0IHRoZSBjaGFsbGVuZ2UgcHJvb2Ygb2Ygd29y
ayBwYWdlIGRvZXNuJiMzOTt0IG5lZWQgdG8gYmUgcHJlc2VudGVkIHRvIHVzZXJzIHRoYXQg
YXJlIG11Y2ggbW9yZSBsaWtlbHkgdG8gYmUgbGVnaXRpbWF0ZS48L3A+PHA+UGxlYXNlIG5v
dGUgdGhhdCBBbnViaXMgcmVxdWlyZXMgdGhlIHVzZSBvZiBtb2Rlcm4gSmF2YVNjcmlwdCBm
ZWF0dXJlcyB0aGF0IHBsdWdpbnMgbGlrZSBKU2hlbHRlciB3aWxsIGRpc2FibGUuIFBsZWFz
ZSBkaXNhYmxlIEpTaGVsdGVyIG9yIG90aGVyIHN1Y2ggcGx1Z2lucyBmb3IgdGhpcyBkb21h
aW4uPC9wPjwvZGV0YWlscz48bm9zY3JpcHQ+PHA+U2FkbHksIHlvdSBtdXN0IGVuYWJsZSBK
YXZhU2NyaXB0IHRvIGdldCBwYXN0IHRoaXMgY2hhbGxlbmdlLiBUaGlzIGlzIHJlcXVpcmVk
IGJlY2F1c2UgQUkgY29tcGFuaWVzIGhhdmUgY2hhbmdlZCB0aGUgc29jaWFsIGNvbnRyYWN0
IGFyb3VuZCBob3cgd2Vic2l0ZSBob3N0aW5nIHdvcmtzLiBBIG5vLUpTIHNvbHV0aW9uIGlz
IGEgd29yay1pbi1wcm9ncmVzcy48L3A+PC9ub3NjcmlwdD48ZGl2IGlkPSJ0ZXN0YXJlYSI+
PC9kaXY+PC9kaXY+PGZvb3Rlcj48ZGl2IGNsYXNzPSJjZW50ZXJlZC1kaXYiPjxwPlByb3Rl
Y3RlZCBieSA8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vVGVjaGFyb0hRL2FudWJpcyI+
QW51YmlzPC9hPiBGcm9tIDxhIGhyZWY9Imh0dHBzOi8vdGVjaGFyby5sb2wiPlRlY2hhcm88
L2E+LiBNYWRlIHdpdGgg4p2k77iPIGluIPCfh6jwn4emLjwvcD48cD5NYXNjb3QgZGVzaWdu
IGJ5IDxhIGhyZWY9Imh0dHBzOi8vYnNreS5hcHAvcHJvZmlsZS9jZWxwaGFzZS5ic2t5LnNv
Y2lhbCI+Q0VMUEhBU0U8L2E+LjwvcD48cD5UaGlzIHdlYnNpdGUgaXMgcnVubmluZyBBbnVi
aXMgdmVyc2lvbiA8Y29kZT4xLjI1LjA8L2NvZGU+LjwvcD48L2Rpdj48L2Zvb3Rlcj48L21h
aW4+PC9ib2R5PjwvaHRtbD4=

--------------2gI2eoKme0bH8KCK7OmOpyT0--

